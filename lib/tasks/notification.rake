namespace :notification do
  desc "Sends notification via SMS to employees, asking them to log if they had overtime or not."
  task sms: :environment do
    if Time.now.sunday?
      employees = Employee.all
      notification_message = "Please click log in the overtime management dashboard to request overtime or confirm your hours for last week: https://overtime-track.herokuapp.com/"

      employees.all.each do |employee|
        SmsTool.send_sms(number: employee.phone, message: notification_message)
      end
    end
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
