User.create! full_name: "Example User", user_name: "example",
  password: "123456", password_confirmation: "123456"

39.times do |n|
  full_name  = Faker::Name.name
  user_name = "example-#{n+1}"
  password = "123456"
  User.create! full_name: full_name, user_name: user_name,
    password: password, password_confirmation: password
end

users = User.order(:created_at).take 6
50.times do
  title = Faker::Lorem.sentence 1
  content = Faker::Lorem.sentence 5
  users.each{|user| user.posts.create! title: title, content: content}
end

users = User.all
user = users.first
following = users[2..50]
followers = users[3..40]
following.each {|followed| user.follow(followed)}
followers.each {|follower| follower.follow(user)}
