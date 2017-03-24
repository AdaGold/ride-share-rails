# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'vinbot'
require 'faker'

CARS = [["Honda", "Accord"], ["Tesla", "Model X"], ["Chevy", "Nova"], ["Honda", "Civic"], ["VW", "Beetle (old)"], ["VW", "Beetle (new)"], ["Chrystler", "PT Cruiser"], ["Ford", "Pinto"]]

drivers = []
passengers = []

50.times do
  car = CARS.sample
  driver = Driver.new name: Faker::LordOfTheRings.character, vin: Vinbot::Vin.generate, car_make: car[0], car_model: car[1]

  driver.save
  drivers.push(driver)
end

150.times do
  passenger = Passenger.new name: Faker::HarryPotter.character, phone_number: Faker::PhoneNumber.cell_phone

  passenger.save
  passengers.push(passenger)
end

500.times do
  trip = Trip.new
  trip.date = Faker::Date.between_except(1.year.ago, 1.year.from_now, Date.today)
  trip.rating = 1 + rand(4) # between 1 and 5
  trip.driver = drivers.sample
  trip.passenger = passengers.sample
  trip.save
end
