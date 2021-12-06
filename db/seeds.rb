require 'faker'


# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# u1 = User.first
# u2 = User.last
50.times do |x|
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    phone: Faker::PhoneNumber.phone_number_with_country_code,
    city: Faker::Demographic.demonym, 
    town: Faker::Nation.capital_city,
    password: '000000',
    password_confirmation:'000000'
  )
end

User.create!(
  first_name: 'admin', 
  last_name: 'admin', 
  email: 'admin@techshelter.fr', 
  password: '000000', 
  password_confirmation: '000000',
  town: 'Cocody',
  city: 'Abidjan',
  phone: '0102030405'
)

User.all.each do |user|
  Store.create!(name: Faker::Company.name, description: Faker::Lorem.paragraph, city: Faker::Demographic.demonym, town: Faker::Nation.capital_city, user_id: user.id).tap do |store|
    50.times do |x|
      numb = rand(1..2000)*500
      Product.create!(name: Faker::Commerce.brand, description: Faker::Lorem.paragraph, price: numb, weight: rand(1..100), is_available: [true, false].sample, store_id: store.id, all_categories: "#{Faker::Types.rb_string}, #{Faker::Book.genre}, #{Faker::Game.platform}, #{Faker::Esport.game }").tap do |product|
        Stock.create!(product_id: product.id, quantity: rand(1..100))
      end
    end
  end
end