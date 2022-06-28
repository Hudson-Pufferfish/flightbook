# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# rubocop:disable all

DURATIONS = {
  'SAN' => {
    'DTW' => 252,
    'JFK' => 304,
    'SFO' => 103,
    'ORD' => 254,
    'SLC' => 111,
    'DFW' => 182,
    'SEA' => 175,
    'BOS' => 308,
    'EWR' => 290,
    'MSP' => 222,
    'PIT' => 247
  },
  'DTW' => {
    'JFK' => 86,
    'SFO' => 284,
    'ORD' => 57,
    'SLC' => 195,
    'DFW' => 137,
    'SEA' => 245,
    'BOS' => 111,
    'EWR' => 112,
    'MSP' => 112,
    'PIT' => 53
  },
  'JFK' => {
    'SFO' => 320,
    'ORD' => 106,
    'SLC' => 251,
    'DFW' => 151,
    'SEA' => 301,
    'BOS' => 51,
    'EWR' => 210,
    'MSP' => 195,
    'PIT' => 68
  },
  'SFO' => {
    'ORD' => 238,
    'SLC' => 109,
    'DFW' => 194,
    'SEA' => 102,
    'BOS' => 334,
    'EWR' => 340,
    'MSP' => 215,
    'PIT' => 284
  },
  'ORD' => {
    'SLC' => 169,
    'DFW' => 116,
    'SEA' => 183,
    'BOS' => 121,
    'EWR' => 72,
    'MSP' => 94,
    'PIT' => 82
  },
  'SLC' => {
    'DFW' => 139,
    'SEA' => 104,
    'BOS' => 285,
    'EWR' => 275,
    'MSP' => 155,
    'PIT' => 206
  },
  'DFW' => {
    'SEA' => 207,
    'BOS' => 202,
    'EWR' => 210,
    'MSP' => 150,
    'PIT' => 147
  },
  'SEA' => {
    'BOS' => 310,
    'EWR' => 325,
    'MSP' => 202,
    'PIT' => 270
  },
  'BOS' => {
    'EWR' => 90,
    'MSP' => 202,
    'PIT' => 92
  },
  'EWR' => {
    'MSP' => 180,
    'PIT' => 92
  },
  'MSP' => {
    'PIT' => 132
  },
  'PIT' => {}
}

def get_duration(origin, destination)
  DURATIONS[origin][destination] || DURATIONS[destination][origin]
end

def random_time(date)
  Faker::Time.between(from: date.beginning_of_day, to: date.end_of_day)
end
# Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)

ActiveRecord::Base.transaction do

  Flight.destroy_all
  Airport.destroy_all

  ActiveRecord::Base.connection.execute("Delete from flights")
  ActiveRecord::Base.connection.execute("DELETE FROM SQLITE_SEQUENCE WHERE name='flights'")

  ActiveRecord::Base.connection.execute("Delete from airports")
  ActiveRecord::Base.connection.execute("DELETE FROM SQLITE_SEQUENCE WHERE name='airports'")


  airports = []
  airports[0] = Airport.create!(code: 'PIT', name: 'Pittsburgh International Airport', city: 'Pittsburgh')
  airports[1] = Airport.create!(code: 'SAN', name: 'San Diego International Airport', city: 'San Diego')
  airports[2] = Airport.create!(code: 'DTW', name: 'Detroit Metropolitan Airport', city: 'Detroit')
  airports[3] = Airport.create!(code: 'JFK', name: 'John F Kennedy International Airport', city: 'New York')
  airports[4] = Airport.create!(code: 'SFO', name: 'San Francisco International Airport', city: 'San Francisco')
  airports[5] = Airport.create!(code: 'ORD', name: 'O\'hare International Airport', city: 'Chicago')
  airports[6] = Airport.create!(code: 'SLC', name: 'Salt Lake City International Airport', city: 'Salt Lake City')
  airports[7] = Airport.create!(code: 'DFW', name: 'Dallas / Fort Worth International Airport', city: 'Dallas')
  airports[8] = Airport.create!(code: 'SEA', name: 'Seattle-Tacoma International Airport', city: 'Seattle')
  airports[9] = Airport.create!(code: 'BOS', name: 'Logan International Airport', city: 'Boston')
  airports[10] = Airport.create!(code: 'EWR', name: 'Newark Liberty International Airport', city: 'Newark')
  airports[11] = Airport.create!(code: 'MSP', name: 'Minneapolis-Saint Paul International Airport', city: 'Minneapolis')

  Date.new(2022, 7, 1).upto(Date.new(2023, 5, 1)).each do |date|
    airports.each do |origin|
      airports.each do |destination|
        next if origin == destination

        rand(2..3).times { Flight.create!(
                                time: random_time(date).strftime("%R"),
                                date: random_time(date).strftime("%Y-%m-%d"),
                                origin: origin,
                                destination: destination,
                                duration: get_duration(origin.code, destination.code),
                                flight_number: get_duration(origin.code, destination.code) * rand(1..5))
                  }
      end
    end
  end
end
