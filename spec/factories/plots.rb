FactoryBot.define do
  factory :plot do
    credit_solicitation { nil }
    payment_day { '2020-10-23' }
    value { '9.99' }

    factory :plot_with_credit_solicitation do
      credit_solicitation { build(:credit_solicitation_without_plots) }
      payment_day { '2020-10-23' }
      value { '9.99' }
    end
  end
end
