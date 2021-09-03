FactoryBot.define do
  factory :user do
    username { Faker::Internet.username(separators: %w(_ -)) }
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 6, max_length: 20) }
    bio { Faker::Lorem.paragraph }
  end
end
