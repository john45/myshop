# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
  AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

10.times do
  title = Faker::Name.first_name
  Feature.create(title: title)
end

10.times do
  name = Faker::Name.first_name
  Category.create(name: name)
end

50.times do
  name = Faker::Book.genre
  description = Faker::Lorem.paragraph
  price = Faker::Commerce.price
  Product.create(name: name, description: description, price: price, category_id: rand(1..10))
end

n = 1
50.times do
  p = Product.find(n)
  title = Faker::Color.color_name
  FeatureValue.create(feature_id: rand(1..10), product_id: n, title: title)

  reviews = rand(1..20)
  reviews.times do
    email = Faker::Internet.email
    author = Faker::Name.first_name + ' ' + Faker::Name.last_name
    product_id = p.id
    body = Faker::Lorem.paragraphs
    rating = rand(1..5)
    published = true

    Review.create(author: author, product_id: product_id, body: body, rating: rating, email: email, published: published)
  end
  n += 1
end

# timess = Product.all.count
# n = 1
# timess.times do
#   p = Product.find(1)
#
#   reviews = rand(1..20)
#   reviews.times do
#     email = Faker::Internet.email
#     author = Faker::Name.first_name + ' ' + Faker::Name.last_name
#     product_id = p.id
#     body = Faker::Lorem.paragraphs
#     rating = rand(1..5)
#     published = true
#
#     Review.create(author: author, product_id: product_id, body: body, rating: rating, email: email, published: published)
#   end
#   n += 1
# end
