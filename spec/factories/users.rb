require 'faker'

FactoryGirl.define do
  factory :user do |f|
    f.full_name { Faker::Name.first_name + " " + Faker::Name.last_name }
  end
end
