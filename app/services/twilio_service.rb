require 'twilio-ruby'

module TwilioService
  class << self
    def client
      Twilio::REST::Client.new(
        ENV.fetch('TWILIO_ACCOUNT_SID'),
        ENV.fetch('TWILIO_AUTH_TOKEN')
        )
    end
    
    def send_sms(recipient, body)
      from = ENV.fetch('TWILIO_PHONE_NUMBER') # Your Twilio number
      to = '+447852406718' # Your mobile phone number

      client.api.account.messages.create(
        from: from,
        to: to,
        body: body
      )
    end
  end
end