@user = User.create(
  			email: "test@test.com", 
  			password: "asdfasdf", 
  			password_confirmation: "asdfasdf",
  			first_name: "Jonathan",
  			last_name: "Mambre",
        phone: "14187411932"
  			)


puts "1 user created"

AdminUser.create(
  			email: "admin@test.com", 
  			password: "asdfasdf", 
  			password_confirmation: "asdfasdf",
  			first_name: "Admin",
  			last_name: "Mambre",
        phone: "14187411932"
  			)


puts "1 admin user created"

10.times do |post|
	Post.create(date: Date.today, rationale: "#{post} rationale content", user_id: @user.id, overtime_request: 2.5)
end

puts "10 posts have been created"