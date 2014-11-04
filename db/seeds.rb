# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


(1..10).each do |i|
  Instructor.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    phone: Faker::PhoneNumber.cell_phone,
    street_address: Faker::Address.street_address,
    city: Faker::Address.city,
    postal_code: Faker::Address.postcode,
    expertise: Faker::Commerce.department(3, true))
end