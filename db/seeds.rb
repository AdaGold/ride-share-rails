require 'csv'

DRIVER_FILE = Rails.root.join('db', 'seed_data', 'drivers.csv')
puts "Loading raw driver data from #{DRIVER_FILE}"

CSV.foreach(DRIVER_FILE, :headers => true) do |row|
  driver = Driver.new
  driver.id = row['id']
  driver.name = row['name']
  driver.vin = row['vin']
  puts "Created driver: #{driver.inspect}"
  driver.save!
end

puts "Added #{Driver.count} driver records"



PASSENGER_FILE = Rails.root.join('db', 'seed_data', 'passengers.csv')
puts "Loading raw passenger data from #{PASSENGER_FILE}"

CSV.foreach(PASSENGER_FILE, :headers => true) do |row|
  passenger = Passenger.new
  passenger.id = row['id']
  passenger.name = row['name']
  passenger.phone_num = row['phone_num']
  puts "Created passenger: #{passenger.inspect}"
  passenger.save!
end

puts "Added #{Passenger.count} passenger records"



TRIP_FILE = Rails.root.join('db', 'seed_data', 'trips.csv')
puts "Loading raw trip data from #{TRIP_FILE}"

CSV.foreach(TRIP_FILE, :headers => true) do |row|
  trip = Trip.new
  trip.id = row['id']
  trip.driver_id = row['driver_id']
  trip.passenger_id = row['passenger_id']
  trip.date = Date.strptime(row['date'], '%Y-%m-%d')
  trip.rating = row['rating']
  puts "Created trip: #{trip.inspect}"
  trip.save!
end

puts "Added #{Trip.count} trip records"


# Since we set the primary key (the ID) manually on each of the
# tables, we've got to tell postgres to reload the latest ID
# values. Otherwise when we create a new record it will try
# to start at ID 1, which will be a conflict.
puts "Manually resetting PK sequence on each table"
ActiveRecord::Base.connection.tables.each do |t|
  ActiveRecord::Base.connection.reset_pk_sequence!(t)
end

puts "done"
