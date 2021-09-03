FactoryBot.define do
  factory :user do
    username { Faker::Internet.username(separators: %w(_ -)) }
    password { Faker::Internet.password(min_length: 6, max_length: 20) }
  end
end
