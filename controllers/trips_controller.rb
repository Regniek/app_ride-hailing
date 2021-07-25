require './config/database.rb'

def show_trips
    trips = DB[:trips]
    return trips.all.to_json
end

def create_trip(driver_id, rider_id, initial_latitude, initial_longitude,initial_time)
    finish_latitude = ''
    finish_longitude = ''
    finish_time = ''
    fare = ''
    fee_paid = false
    trip = DB["INSERT INTO trips (driver_id, rider_id, initial_latitude, initial_longitude, initial_time, finish_time, finish_longitude, finish_latitude, fare, fee_paid ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",driver_id, rider_id, initial_latitude, initial_longitude, initial_time, finish_time, finish_longitude, finish_latitude, fare, fee_paid]
    trip.insert(1)
    return "Trip start!"
end