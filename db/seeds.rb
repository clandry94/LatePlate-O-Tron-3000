# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
# BreakfastPlate.delete_all
# DinnerPlate.delete_all
# RecurringBreakfastPlate.delete_all
# RecurringDinnerPlate.delete_all
User.create(first_name: 'Conor',
            last_name: 'Landry',
            email_address: 'clandry94@gmail.com',
            phone_number: '281-787-5729',
            password: 'password',
            password_confirmation: 'password',
            admin: true)

99.times do |n|
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  email_address = Faker::Internet.email
  phone_number = Faker::PhoneNumber.phone_number
  password = 'password'
  User.create(first_name: first_name,
              last_name: last_name,
              email_address: email_address,
              phone_number: phone_number,
              password: password,
              password_confirmation: password)
end
