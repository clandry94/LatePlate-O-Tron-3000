require 'twilio-ruby'
# push bullet api call builder class
class SmsSender
  attr_accessor :account_sid, :auth_token, :client

  def initialize()
    @account_sid = "ACf206992a4adffe4d28a0ed4b0ae190e5"
    @auth_token = "5a5f13ada044d16a86d92a70441953fd"

    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  # Sends a text message to the phone number given in the param with the
  # message given in the param
  def send_message(ph_number, message)
    message = @client.account.messages.create({
    	:from => '+18325987523',
    	:to => ph_number,
    	:body => message,
    })
  end
end
