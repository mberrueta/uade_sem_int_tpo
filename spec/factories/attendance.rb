FactoryBot.define do
  factory :attendance do
    student
    present_code { [:full, :half].sample }
    date { Faker::Date.forward }
    course
  end
end
