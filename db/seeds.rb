# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

interests = [
  "Basketball",
  "Soccer",
  "Football",
  "Volleyball",
  "Running",
  "Skiing",
  "Tennis",
  "Cycling",
  "Swimming",
  "Baseball",
  "Mountain climbing",
  "Hiking",
  "Boardgames",
  "Reading",
  "Networking",
  "Volunteering",
  "Public speaking",
  "Dancing",
  "Camping" ,
  "Language",
  "Cooking",
  "Baking",
  "Gardening",
  "Theater",
  "Yoga",
  "Art",
  "Music",
  "Chess",
  "Video Games",
  "Programming",
  "Fashion",
  "Film",
  "Meditation",
  "Sewing",
  "Travel"
]

interests.each do |interest|
  Interest.create(name: interest)
end

25.times do
  user = User.new(
    username: Faker::Internet.user_name,
    email: Faker::Internet.email,
    password: "password",
    bio: Faker::Lorem.paragraph_by_chars(number: rand(300..800))
  )

  interests = Interest.randomized(rand(3..6))
  interests.each do |interest|
    user.interests << interest
  end

  user.save
end

100.times do
  users = User.randomized(2)
  user1 = users.first
  user2 = users.last

  message = Message.new(
    sender: user1,
    recipient: user2,
    body: Faker::Lorem.paragraph_by_chars(number: rand(100..500))
  )
  message.save
end