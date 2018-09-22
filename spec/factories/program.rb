FactoryBot.define do
  factory :program do
    day { Faker::Date.forward }
    subject
  end
end
