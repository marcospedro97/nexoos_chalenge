class CreditSolicitation < ApplicationRecord
  belongs_to :applicant
  belongs_to :plot_tax
  has_many :plots, dependent: :destroy

  validates :value, presence: true
  validates :plot_tax_id, presence: true
  validate :dont_have_open_plot

  before_create :add_interest_rate
  before_create :calculate_plots_value
  before_create :calculate_value_with_rate
  before_create :make_plots

  def self.with_open_plots(applicant_id)
    applicant = Applicant.find(applicant_id)
    today = Date.current.strftime('%d/%m/%y')
    applicant.credit_solicitations.each do |credit|
      if credit.plots.to_a.bsearch do |p|
           p.payment_day.strftime('%d/%m/%y') > today
         end
        return credit
      end
    end
  end

  private

  def dont_have_open_plot
    today = Date.current
    applicant.credit_solicitations.each do |credit|
      if credit.plots.to_a.bsearch do |p|
           p.payment_day > today
         end
        return errors.add(:applicant, 'Já tem empréstimos abertos')
      end
    end
  end

  def add_interest_rate
    self.interest_rate = plot_tax.tax
    self.plots_amount = plot_tax.plot
  end

  def calculate_plots_value
    self.plots_value = calculate_pmt
  end

  def calculate_value_with_rate
    self.value_with_rate = plots_value * plots_amount
  end

  def calculate_pmt
    pv = (1 + interest_rate)**plots_amount
    (pv * interest_rate / (pv - 1)) * value
  end

  def make_plots
    date = 1.month.from_now
    end_date = (plots_amount + 1).months.from_now
    while date < end_date
      plots << Plot.new(payment_day: date, value: plots_value)
      date += 1.month
    end
  end
end
