require 'faker'

FactoryBot.define do
  factory :content do
    title { Faker::Book.title }
    author { Faker::Book.author }
    published_date { Date.today }
    summary { Faker::Lorem.sentence(2) }
    content { Faker::Lorem.paragraphs(4).join(" ") }
    status { ["published", "draft"].sample }

    trait :published do
      status { "published" }
    end

    trait :draft do
      status { "draft" }
    end
  end
end
