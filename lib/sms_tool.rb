module SmsTool
	account_sid = Rails.application.credentials.twilio_account_sid
	auth_token = Rails.application.credentials.twilio_auth_token

	@client = Twilio::REST::Client.new account_sid, auth_token

	def self.send_sms(number:, message:)
		@client.messages.create(
	      from: Rails.application.credentials.twilio_phone_number,
	      to: "+1#{number}",
	      body: "#{message}"
	    )
	end
end