# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Alert.destroy_all
User.destroy_all
AdminUser.destroy_all

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

ada = User.new(
  first_name: "Ada",
  last_name: "Ardor",
  email: 'ada@nabokov.com', 
  id: 1,
  fire_dept: 1,
  fire_station: 1
)
ada.save!

10.times do
  alert = Alert.new(level: rand(1..9), user_id: ada.id)
  alert.save!
end

p "Created #{User.count} users and #{Alert.count} alerts"

