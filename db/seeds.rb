# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name: "Tester")

10.times do |n|
  name = Faker::Name.unique.first_name
  User.create!(name: name)
end

users = User.order(:created_at).take(6)
10.times do
  start_date = rand(10.days).seconds.ago
  description = Faker::Lorem.sentence
  users.each do |user|
    user.events.create!(start_date: start_date, description: description)
  end
end
