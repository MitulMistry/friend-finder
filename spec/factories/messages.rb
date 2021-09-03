FactoryBot.define do
  factory :message do
    body { Faker::Lorem.paragraph }
    association :sender, factory: :user
    association :recipient, factory: :user
  end
end
