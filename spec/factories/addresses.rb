FactoryBot.define do
  factory :address do
    street { 'MyString' }
    number { 1 }
    complement { 'MyString' }
    applicant { create(:applicant) }

    factory :address_without_applicant do
      street { 'MyString' }
      number { 1 }
      complement { 'MyString' }
      applicant { nil }
    end
  end
end
