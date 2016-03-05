# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



def init_recur_plates user
  @recur_breakfast_plate = RecurringBreakfastPlate.new
  @recur_breakfast_plate.user_id = user.id
  @recur_breakfast_plate.monday = false
  @recur_breakfast_plate.tuesday = false
  @recur_breakfast_plate.wednesday = false
  @recur_breakfast_plate.thursday = false
  @recur_breakfast_plate.friday = false

  @recur_breakfast_plate.save

  @recur_dinner_plate = RecurringDinnerPlate.new
  @recur_dinner_plate.user_id = user.id
  @recur_dinner_plate.monday = false
  @recur_dinner_plate.tuesday = false
  @recur_dinner_plate.wednesday = false
  @recur_dinner_plate.thursday = false
  @recur_dinner_plate.friday = false

  @recur_dinner_plate.save
end


User.delete_all
BreakfastPlate.delete_all
DinnerPlate.delete_all
RecurringBreakfastPlate.delete_all
RecurringDinnerPlate.delete_all

admin = User.create(first_name: 'Conor',
            last_name: 'Landry',
            email_address: 'clandry94@gmail.com',
            phone_number: '281-787-5729',
            password: 'password',
            password_confirmation: 'password',
            admin: true)

init_recur_plates admin

99.times do |_n|
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  email_address = Faker::Internet.email
  phone_number = Faker::PhoneNumber.phone_number
  password = 'password'
  user = User.create(first_name: first_name,
              last_name: last_name,
              email_address: email_address,
              phone_number: phone_number,
              password: password,
              password_confirmation: password)
  init_recur_plates user
end
