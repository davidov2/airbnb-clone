# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
Ad.destroy_all

3.times do


  password = Faker::Internet.password(8)
  user = User.create!(name: Faker::Name.last_name, email: Faker::Internet.email, password: password)
  user.save

  5.times do
    address = Faker::Address.street_address
    annonce = Ad.create(description: Faker::Lorem.paragraph, price: Faker::Number.number(2), flight_date: Faker::Date.between(2.days.ago, Date.today), flight_time: Faker::Number.number(2), address: address)
    annonce.user = user
    annonce.save!
  end
end

puts "#{User.count} user et #{Ad.count} annonces crées !"
