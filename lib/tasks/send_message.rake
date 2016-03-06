require_relative '../message_sender/sms_builder.rb'

desc "This task sends a list of breakfast or dinner plates to the chef"
task :send_message => :environment do
  puts "Initializing message builder for breakfast test"
  puts "------------------------------------------------"
  sms = SmsBuilder.new(Date.tomorrow, 0)
  puts sms.message
  puts
  puts "================================================"
  puts
  puts "Initializing message builder for dinner test"
  puts "------------------------------------------------"
  sms = SmsBuilder.new(Date.tomorrow, 1)
  puts sms.message
  puts
  puts "================================================"
  puts
  puts "done."
end
