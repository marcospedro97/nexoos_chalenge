FactoryBot.define do
  factory :applicant do
    social_name { 'MyString' }
    cnpj { Faker::CNPJ.numeric }
    user { create(:user) }
    phones { [association(:phone_without_applicant, strategy: :build)] }
    addresses { [association(:address_without_applicant, strategy: :build)] }

    factory :applicant_without_phone do
      social_name { 'MyString' }
      cnpj { 'MyString' }
      user { create(:user) }
      addresses { [association(:address, strategy: :build)] }
    end

    factory :applicant_without_address do
      social_name { 'MyString' }
      cnpj { 'MyString' }
      user { create(:user) }
      phones { [association(:phone_without_applicant, strategy: :build)] }
    end
  end
end
