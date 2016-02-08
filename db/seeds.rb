# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Name.delete_all

File.open("#{Rails.root}/db/nameslist.txt") do |names|
  names.read.each_line do |full_name|
    Name.create(:full_name => full_name)
  end
end
