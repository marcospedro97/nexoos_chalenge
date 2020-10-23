class CreditSolicitation < ApplicationRecord
  belongs_to :applicant
  has_many :plots, dependent: :destroy

  validates :value, presence: true
  validates :plots_amount, presence: true

  before_create :add_interest_rate
  before_create :calculate_plots_value
  before_create :calculate_value_with_rate
  before_create :make_plots

  private

  def make_plots
    date = 1.month.from_now
    end_date = (plots_amount + 1).months.from_now
    while date <= end_date
      plots << Plot.new(payment_day: date, value: plots_value)
      date += 1.month
    end
  end

  def add_interest_rate
    self.interest_rate = 0.15
  end

  def calculate_value_with_rate
    self.value_with_rate = plots_value * plots_amount
  end

  def calculate_plots_value
    pmt = (((1.015**plots_amount) * 0.015) / ((1.015**plots_amount) - 1))
    self.plots_value = value * pmt
  end
end
