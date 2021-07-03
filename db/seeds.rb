# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'Faker'
User.destroy_all

5.times do
  User.create(
    email:Faker::Internet.email,
    password: "password",
    first_name:Faker::FunnyName.name,
    last_name:Faker::FunnyName.name,
    about_me:Faker::Quote,
    discipline: ["crossfit", "boxing", "weights"].sample
    level: ["beginner", "intermediate", "advanced"].sample
    price: rand(20..100)
    )
end
