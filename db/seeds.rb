# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
n = 1
53.times do

  p = Product.find(n)
  p.name = Faker::Book.genre
  p.save

  n += 1
end

# 50.times do
#   name = Faker::Team.creature
#   description = Faker::Lorem.paragraph
#   price = Faker::Commerce.price
#   Product.create(name: name, description: description, price: price, category_id: rand(1..4))
# end