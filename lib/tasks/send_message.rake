require_relative '../message_sender/sms_builder.rb'
require_relative '../message_sender/sms_sender.rb'

desc "This task sends a list of breakfast or dinner plates to the chef"
task :send_message => :environment do
  request_day = Date.today
  puts "Initializing..."
  sms = SmsBuilder.new(request_day, resolve_time)
  message = sms.message
  sender = SmsSender.new
  puts "Sending message for #{request_day}..."
  #sender.send_message(ENV["CHEF_PHONE_NUMBER"], message)
  puts "Message to #{ENV["CHEF_PHONE_NUMBER"]}"
  puts
  puts message
  puts
  puts "done."
end

def resolve_time
    time = Time.new.hour
    if time <= 12 && time >= 0
      return 0
    else
      return 1
    end
end
