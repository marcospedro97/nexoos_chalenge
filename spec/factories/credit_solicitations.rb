FactoryBot.define do
  factory :credit_solicitation do
    applicant { create(:applicant) }
    value { '9.99' }
    plots_amount { 12 }
    interest_rate { 1.5 }
    plot_tax { create(:plot_tax) }
    value_with_rate { '9.99' }
    plots_value { '9.99' }

    factory :credit_solicitation_without_plots_amount do
      applicant { create(:applicant) }
      value { '9.99' }
      interest_rate { 1.5 }
      plot_tax { create(:plot_tax) }
      value_with_rate { '9.99' }
      plots_value { '9.99' }
    end
  end
end
