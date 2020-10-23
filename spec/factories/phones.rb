FactoryBot.define do
  factory :phone do
    applicant { create(:applicant_without_phone) }
    number { 'MyString' }

    factory :phone_without_applicant do
      number { 'MyString' }
      applicant { nil }
    end
  end
end
