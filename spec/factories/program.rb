FactoryBot.define do
  factory :program do
    date { Faker::Date.forward }
    subject
    picture_url { Faker::LoremFlickr.image }
    title { Faker::Name.name }
    description { Faker::Lorem.sentence(3) }
  end
end
