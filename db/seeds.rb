# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Song.destroy_all
MatchChat.destroy_all
Genre.destroy_all
Message.destroy_all
Photo.destroy_all

users = []
20.times do |i|
  users.push(User.create(name: Faker::Name.name, email: Faker::Internet.safe_email, password: "password", bio: "I like music and whatnot.", location: "Washington, DC", img_url: Faker::Avatar.image, seeking: "Uke players", search_radius: 100 ))
end

5.times do |i|
  MatchChat.create(friender_id: users[i], friendee_id: users[i+1], accepted: true)
end

