class SmsController < ApplicationController
  
  CTW_NUMBER = '+14157023803'

  def receive 
    body = params["Body"]
    number = params["From"]

    if User.find_by_phone(number)

      # Confirmation of our text parsing
      if body.downcase == ("y" || "yes")
        report_success_to_user(number)
      elsif body.downcase == ("n" || "no")
        try_again(number)

      # User phone registration
      elsif user_registration_text(number)
        confirm_user_phone(number)

      # Workout logging
      else
        log_user_wod(number, body)
      end
         
    else
      send_message(number, "You must register on crushthewod.com before text-logging workouts!")
    end

	end

	private

	def respond_to_user(number, parsed_body)
	  send_message(number, "You logged '#{parsed_body}' -- y/n")
	end

	def log_user_wod(number, body)
		parsed_body = Workout.parse_text(body)
		user = User.find_by_phone(number)
		if Workout.create(
			:description => parsed_body,
			:user_id => user.id,
			:created_at => Time.now
		)
			respond_to_user(number, parsed_body)
		else
			report_error_to_user(number)
		end
	end

	def try_again(number)
		if User.find_by_phone(number)
			workout = User.find_by_phone(number).workouts.last
			workout.delete
			send_message(number, "Sorry we couldn't log correctly. Try again or use crushthewod.com")
		else
			send_message(number, "Something went wrong. Please log on crushthewod.com")
		end
	end

	def report_error_to_user(number)
		send_message(number, "Message log failed! Try again or use our site.")
	end

	def report_success_to_user(number)
		send_message(number, "Message log successful! View your log history on crushthewod.com")
	end

	def user_registration_text(number)
		if !User.find_by_phone(number).phone_verified
			true
		else
			false
		end
	end

	def confirm_user_phone(number)
		user = User.find_by_phone(number)
		user.update_attribute(:phone_verified, true)
		m = "Hey #{user.first_name.capitalize} - your number has been confirmed, and you're ready to start logging."
		send_message(number, m)
	end	

	def send_message(number, message)
		@client = Twilio::REST::Client.new 'AC40fd009b0c4b39ac00f8966af9f7ef49', '9eda78849c906a22369bbea1b98064b3'
		@client.account.sms.messages.create(
		  :from => CTW_NUMBER,
		  :to => number,
		  :body => message
		)
	end

end