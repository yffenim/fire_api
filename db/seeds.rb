# Delete current data
Alert.destroy_all
Second.destroy_all
Third.destroy_all
User.destroy_all
AdminUser.destroy_all

# FIRST SEED USERS
# Active Admin default seed
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?


# Dev user
ada = User.new(
  name: 'Ada',
  uid: 'ada@ardour.com',
  email: 'ada@ardour.com', 
  password: 'password',
  password_confirmation: 'password'
)
ada.save!

# SEED SYSTEM DATA
# THIS IS SYSTEM DEFAULT DATA THAT MUST EXIST AT ALL TIMES
system_default_for_alerts = Alert.new(
  level: 2.5, 
    user_id: ada.id, 
    title: "alertness",
  )
system_default_for_alerts.save!

system_default_for_seconds = Second.new(
  level: 2.5, 
    user_id: ada.id, 
    title: "title II",
  )
system_default_for_seconds.save!

system_default_for_thirds = Third.new(
  level: 2.5, 
    user_id: ada.id, 
    title: "title II",
  )
system_default_for_thirds.save!


# SEED DEV DATA
20.times do
  num = rand(1..9)
  alert = Alert.new(
    level: num,
    user_id: ada.id, 
    title: "alertness",
    created_at: num.days.ago,
    updated_at: num.days.ago
  )
  alert.save!
end



# p "Created #{User.count} users with #{Alert.count} #{Alert.first.title} levels  and #{Second.count} #{Second.first.title} levels"

p "Created #{User.count} users with #{Alert.count} #{Alert.first.title} levels"
