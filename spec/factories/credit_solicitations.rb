FactoryBot.define do
  factory :credit_solicitation do
    applicant { nil }
    value { "9.99" }
    plots { 1 }
    interest_rate { 1.5 }

    factory :credit_solicitation_with_applicant do
      applicant { build(:applicant) }
      value { "9.99" }
      plots { 1 }
      interest_rate { 1.5 }     
    end
  end
end
