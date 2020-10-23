FactoryBot.define do
  factory :phone do
    applicant { build(:applicant_without_phone) }
    number { Faker::PhoneNumber.unique.phone_number }

    factory :phone_without_applicant do
      number { Faker::PhoneNumber.unique.phone_number }
      applicant { nil }
    end
  end
end
