require './config/database.rb'
require 'date'
def show_trips
    trips = DB[:trips]
    return trips.all.to_json
end

def start_trip(rider_id, initial_latitude, initial_longitude, finish_latitude, finish_longitude)
    driver_id = 1
    puts DateTime.now
    initial_time = DateTime.now
    finish_time = DateTime.now
    fare = 0.0
    fee_paid = false
    trip = DB["INSERT INTO trips (driver_id, rider_id, initial_latitude, initial_longitude, initial_time, finish_time, finish_longitude, finish_latitude, fare, fee_paid ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",driver_id, rider_id, initial_latitude, initial_longitude, initial_time, finish_time, finish_longitude, finish_latitude, fare, fee_paid]
    trip.insert(1)
    return "Trip start!"
end

def finish_trip(finish_latitude, finish_longitude, trip_id)
    finish_time = DateTime.now
    trip = DB["UPDATE trips SET finish_latitude = '#{finish_latitude}', finish_longitude = '#{finish_longitude}', finish_time = '#{finish_time}' WHERE id = #{trip_id}"]
    return "Trip finish!"
end



def calculate_kms_trip(finish_latitude,finish_longitude,initial_latitude,initial_longitude)
    r_earth = 6371
    delta_lat = ((finish_longitude - initial_longitude)*Math::PI)/180
    delta_long = ((finish_longitude - initial_longitude)*Math::PI)/180
    a = Math.sin(delta_lat/2) + Math.cos(initial_latitude) * Math.cos(finish_latitude)*Math.sin(delta_long/2)
    c = 2 * Math.atan2(Math.sqrt(a),Math.sqrt(1-a))
    return c
end

