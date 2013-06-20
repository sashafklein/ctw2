class SmsController < ApplicationController
  def receive 
    # let's pretend that we've mapped this action to 
    # http://localhost:3000/sms in the routes.rb file
    
    message_body = params["Body"]
    from_number = params["From"]
 	@client = Twilio::REST::Client.new 'AC40fd009b0c4b39ac00f8966af9f7ef49', '9eda78849c906a22369bbea1b98064b3'
 	@client.account.sms.messages.create(
  :from => '+14157023803',
  :to => '+19096187761',
  :body => 'Received your text fucker!'
)
  end
end