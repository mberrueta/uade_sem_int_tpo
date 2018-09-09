FactoryBot.define do
  factory :organization do
    name { Faker::Company.name }
    email { Faker::Internet.email }
    phone { Faker::PhoneNumber.phone_number }
    address { Faker::Address.full_address }
    web_page { Faker::Internet.url }
    logo { Faker::Internet.url }
  end
end
