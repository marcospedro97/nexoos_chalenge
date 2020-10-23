FactoryBot.define do
  factory :credit_solicitation do
    applicant { nil }
    value { '9.99' }
    plots_amount { build_list(:plot, 12) }
    interest_rate { 1.5 }

    factory :credit_solicitation_with_applicant do
      applicant { build(:applicant) }
      value { '9.99' }
      plots_amount { 12 }
      plots { build_list(:plot, 12) }
      interest_rate { 1.5 }
    end

    factory :credit_solicitation_without_plots do
      applicant { build(:applicant) }
      value { '9.99' }
      plots_amount { 12 }
      plots { [] }
      interest_rate { 1.5 }
    end
  end
end
