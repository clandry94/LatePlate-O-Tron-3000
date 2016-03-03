require 'faker'

FactoryGirl.define do
  factory :user do |f|
    password = Faker::Internet.password(8,256)
    f.first_name { Faker::Name.first_name }
    f.last_name { Faker::Name.last_name }
    f.email_address { Faker::Internet.email }
    f.phone_number { Faker::PhoneNumber.phone_number }
    f.password { password }
    f.password_confirmation { password}
  end
end
