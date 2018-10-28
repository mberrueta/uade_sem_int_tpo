FactoryBot.define do
  factory :assist do
    student
    present_code { [:full, :half].sample }
    date { Faker::Date.forward }
    course
  end
end
