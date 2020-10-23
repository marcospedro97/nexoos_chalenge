FactoryBot.define do
  factory :user do
    email { Faker::Internet.unique.email }
    password { '123456789' }
  end
end
