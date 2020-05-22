@user = User.create(
  			email: "test@test.com", 
  			password: "asdfasdf", 
  			password_confirmation: "asdfasdf",
  			first_name: "Jonathan",
  			last_name: "Mambre"
  			)


puts "1 user created"

AdminUser.create(
  			email: "admin@test.com", 
  			password: "asdfasdf", 
  			password_confirmation: "asdfasdf",
  			first_name: "Admin",
  			last_name: "Mambre"
  			)


puts "1 admin user created"

10.times do |post|
	Post.create(date: Date.today, rationale: "#{post} rationale content", user_id: @user.id)
end

puts "10 posts have been created"