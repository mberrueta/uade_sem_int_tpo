FactoryBot.define do
  factory :person do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    phone { Faker::PhoneNumber.phone_number }
    address { Faker::Address.full_address }
    email { Faker::Internet.email }
    gender { [:female, :male, :other].sample }
    organization

    factory :student, class: Student do
    end

    factory :parent, class: Parent do
    end

    factory :teacher, class: Teacher do
    end

    factory :manager, class: Manager do
    end
  end
end
