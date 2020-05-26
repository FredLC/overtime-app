namespace :notification do
  desc "Sends notification via SMS to employees, asking them to log if they had overtime or not."
  task sms: :environment do
  	
  end

  desc "Sends email notification to managers (admin users) each day to inform them of pending overtime requests."
  task manager_email: :environment do
  	submitted_posts = Post.submitted
  	admin_users = AdminUser.all

  	if submitted_posts.count > 0
  		admin_users.each do |admin|
  			ManagerMailer.email(admin).deliver_later
  		end
  	end
  end

end
