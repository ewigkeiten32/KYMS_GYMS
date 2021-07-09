# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"

Booking.destroy_all
Trainer.destroy_all
User.destroy_all

num = 1

20.times do
  file= URI.open('https://thispersondoesnotexist.com/image')
  # user= User.new()
  user = User.create!(
    email:Faker::Internet.email,
    password: "password",
    first_name:Faker::FunnyName.name,
    last_name:Faker::FunnyName.name,
    about_me:Faker::Lorem.sentence
    )
    user.photo.attach(io: file, filename: "photo#{num}", content_type: 'image/png')
  trainer = Trainer.create!(
    user: user,
    about_me:Faker::Quote.famous_last_words,
    discipline: ["crossfit", "boxing", "weights"].sample,
    level: ["beginner", "intermediate", "advanced"].sample,
    price: rand(20..100)
    )
  num += 1
end
  booking = Booking.create!(
    user_id: User.first.id,
    trainer_id: Trainer.last.id,
    start_time: Date.today,
    end_time: Date.today + 3.hours,
    )
puts "Created #{User.count} users"
puts "Created #{Trainer.count} trainers"
puts "Created #{Booking.count} bookings"
