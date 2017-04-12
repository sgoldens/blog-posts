# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

User.create(name: 'tweety', email: 'bird@ruby.com', password: '123456')
User.create(name: 'daffy', email: 'daffy@ruby.com', password: '123456')
10.times do 
  User.create(name: Faker::GameOfThrones.character, email: Faker::Internet.email, password: Faker::Lorem.word)
end
p "10 Users created"
u1 = User.first
u2 = User.last
7.times do 
  Post.create(title: Faker::Commerce.product_name, categories: Faker::Beer.style, content: Faker::Lorem.paragraph(10, true, 4), user: u1)
  Post.create(title: Faker::Commerce.product_name, categories: Faker::Beer.style, content: Faker::Lorem.paragraph(10, true, 4), user: u2)
end
p "14 Posts created across two users"