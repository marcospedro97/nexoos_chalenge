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
    credit_solicitation = where(applicant_id: applicant_id).last
    credit_solicitation.plots = Plot.open(credit_solicitation.id)
    credit_solicitation
  end

  private

  def dont_have_open_plot
    credit_solicitation = CreditSolicitation.where(applicant_id: applicant_id)
                                            .last
    return if credit_solicitation.blank?

    plots = Plot.open(credit_solicitation.id)
    return errors.add(:applicant, 'Já tem empréstimos abertos') if plots.any?
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
    end_date = plots_amount.months.from_now
    while date < end_date
      plots << Plot.new(payment_day: date, value: plots_value)
      date += 1.month
    end
  end
end
