# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Country.create name: 'USA'
Country.create name: 'France'
Country.create name: 'Belarus'

Airport.create name: 'Airport1', city: 'USACity1', country_id: Country.find_by_name('USA').id
Airport.create name: 'Airport2', city: 'USACity2', country_id: Country.find_by_name('USA').id
Airport.create name: 'Airport3', city: 'FranceCity1', country_id: Country.find_by_name('France').id

Plane.create name: 'Plane1', seats: 120
Plane.create name: 'Plane2', seats: 120
Plane.create name: 'Plane3', seats: 80

User.create first_name: 'Test1', last_name: 'Test1', phone: '111-111-111', email: 'test1@mail.com'
User.create first_name: 'Test2', last_name: 'Test2', phone: '222-222-222', email: 'test2@mail.com'
User.create first_name: 'Test3', last_name: 'Test3', phone: '333-333-333', email: 'test3@mail.com'

Trip.create cost: 100, time_out: (Time.now + 1.days), time_in: (Time.now + 1.days + 5.hours), plane_id: Plane.find_by_name('Plane1').id, airport_from_id: Airport.find_by_name('Airport1').id, airport_to_id: Airport.find_by_name('Airport2').id
Trip.create cost: 320.44, time_out: Time.now + 3.days, time_in: Time.now + 3.days + 8.hours, plane_id: Plane.find_by_name('Plane2').id, airport_from_id: Airport.find_by_name('Airport2').id, airport_to_id: Airport.find_by_name('Airport3').id
Trip.create cost: 120.50, time_out: Time.now + 5.days, time_in: Time.now + 5.days + 2.hours, plane_id: Plane.find_by_name('Plane3').id, airport_from_id: Airport.find_by_name('Airport1').id, airport_to_id: Airport.find_by_name('Airport3').id

Trip.find(1).users << User.find_by_first_name('Test1')
Trip.find(1).users << User.find_by_first_name('Test2')
Trip.find(2).users << User.find_by_first_name('Test2')
Trip.find(2).users << User.find_by_first_name('Test3')
Trip.find(3).users << User.find_by_first_name('Test1')
Trip.find(3).users << User.find_by_first_name('Test2')
Trip.find(3).users << User.find_by_first_name('Test3')