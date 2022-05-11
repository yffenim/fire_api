# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Second.destroy_all
Alert.destroy_all
User.destroy_all
AdminUser.destroy_all

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

ada = User.new(
  name: 'Ada',
  uid: 'ada@ardour.com',
  email: 'ada@ardour.com', 
  password: 'password',
  password_confirmation: 'password'
)
ada.save!

20.times do
  num = rand(1..10)
  alert = Alert.new(
    level: rand(1..9),
    user_id: ada.id, 
    title: "alertness",
    created_at: num.days.ago,
    updated_at: num.days.ago
  )
  alert.save!
  second = Second.new(
    level: rand(1..9), 
    user_id: ada.id, 
    title: "appetite",
    created_at: num.days.ago,
    updated_at: num.days.ago
  )
  second.save!
end

p "Created #{User.count} users with #{Alert.count} #{Alert.first.title} levels  and #{Second.count} #{Second.first.title} levels"

