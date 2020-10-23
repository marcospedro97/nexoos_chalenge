FactoryBot.define do
  factory :address do
    street { 'MyString' }
    number { 1 }
    complement { 'MyString' }
    applicant { create(:applicant) }
    zip_code { '123456789' }

    factory :address_without_applicant do
      street { 'MyString' }
      number { 1 }
      complement { 'MyString' }
      applicant { nil }
      zip_code { '123456789' }
    end
  end
end
