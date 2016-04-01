# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Faker::Config.locale = :fr

User.destroy_all
Ad.destroy_all

30.times do

  password = Faker::Internet.password(8)
  user = User.create!(name: Faker::Name.last_name, email: Faker::Internet.email, password: password, pilote: false)
  user.picture = Faker::Avatar.image(user.name.parameterize, "50x50")
  puts user.picture
  user.save

  3.times do
    address = Faker::Address.street_address +', France'
    annonce = Ad.create(description: Faker::Lorem.paragraph, price: Faker::Number.number(2), flight_date: Faker::Date.between(2.days.ago, Date.today), flight_time: Faker::Number.number(2), address: address)
    annonce.user = user
    image_url = Faker::Avatar.image(('Vol depuis ' + Faker::Address.city).parameterize, "300x150", "jpg")
    annonce.remote_photo_url = image_url
    annonce.save!
    puts address
  end
end

puts "#{User.count} user et #{Ad.count} annonces crées !"
