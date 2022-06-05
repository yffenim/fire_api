# Delete current data
Alert.destroy_all
Second.destroy_all
Third.destroy_all
User.destroy_all
AdminUser.destroy_all

# Active Admin default seed
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

# create new user with default password of "password"
# and model objects with 5 default alertness 
def create_new_user(name, email, uid, second_model, third_model, second_total, third_total)
  new_user = User.new(
    id: uid,
    name: name,
    uid: email,
    email: email,
    password: 'password',
    password_confirmation: 'password'
  )
  new_user.save!

  # THIS IS SYSTEM DEFAULT DATA THAT MUST EXIST AT ALL TIMES
  # Front end user flow: this is created w/ the two model titles
  system_default_for_alerts = Alert.new(
    level: 5, 
    user_id: new_user.id, 
    title: "Alertness",
  )
  system_default_for_alerts.save!

  system_default_for_seconds = Second.new(
    level: 5, 
    user_id: new_user.id, 
    title: second_model,
  )
  system_default_for_seconds.save!

  system_default_for_thirds = Third.new(
    level: 5,
    user_id: new_user.id, 
    title: third_model,
  )
  system_default_for_thirds.save!


  # MODEL OBJECT SEEDS
  5.times do
    num = rand(1..9)
    alert = Alert.new(
      level: num,
      user_id: new_user.id, 
      title: "alertness",
      created_at: num.days.ago,
      updated_at: num.days.ago
    )
    alert.save!
  end
  
  second_total.times do
    num = rand(1..9)
    second = Second.new(
      level: num,
      user_id: new_user.id, 
      title: second_model,
      created_at: num.days.ago,
      updated_at: num.days.ago
    )
    second.save!
  end

  third_total.times do
    num = rand(1..9)
    third = Third.new(
      level: num,
      user_id: new_user.id,
      title: third_model,
      created_at: num.days.ago,
      updated_at: num.days.ago
    )
    third.save!
  end

  p "Created new user #{new_user.name} with #{new_user.alerts.count} x #{Alert.first.title}, #{new_user.seconds.count} x #{Second.first.title} levels and #{new_user.thirds.count} x #{Third.first.title}!"

end

# def create_new_user(name, email, uid, second_model, third_model, second_total, third_total)
create_new_user('Ada', 'ada@ardour.com', 1, 'Appetite', 'mood', 5, 1)
create_new_user('Hal', 'hal@incandenz.com', 2, 'Training', 'Perform', 0, 0)

p "Total users: #{User.count}"
