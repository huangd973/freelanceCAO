FactoryBot.define do
  factory :project do
    name { Faker::Company.bs }
    created_by { Faker::Book.author }
    email { Faker::Internet.email }
    category { "Application web" }
    description { Faker::Lorem.paragraph }
    budget { rand(100..500) }
    published_at { Faker::Date.between(from: 20.years.ago, to: Date.yesterday) }
  end
end
