require './config/database.rb'
require 'date'
require 'pry'
def show_trips
    trips = DB[:trips]
    return trips.all.to_json
end

def start_trip(rider_id, initial_latitude, initial_longitude, finish_latitude, finish_longitude)
    driver_id = 1
    initial_time = Time.now
    finish_time = Time.now
    fare = 0.0
    fee_paid = false
    trip = DB["INSERT INTO trips (driver_id, rider_id, initial_latitude, initial_longitude, initial_time, finish_time, finish_longitude, finish_latitude, fare, fee_paid ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",driver_id, rider_id, initial_latitude, initial_longitude, initial_time, finish_time, finish_longitude, finish_latitude, fare, fee_paid]
    trip.insert(1)
    return "Trip start!"
end

def finish_trip(trip_id, finish_latitude, finish_longitude )

    finish_time = Time.now
    trip = DB["UPDATE trips SET finish_latitude = '#{finish_latitude}', finish_longitude = '#{finish_longitude}', finish_time = '#{finish_time}' WHERE id = #{trip_id}"]
    trip.update
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

def calculate_min_trip(finish_time,initial_time)
    min = TimeDifference.between(initial_time,finish_time).in_minutes
    return min
end

def calculate_fare(id)
    trip = DB[:trips].where(id:id)
    kms = calculate_kms_trip(trip.finish_latitude,trip.finish_longitude,trip.initial_latitude,trip.initial_longitude)
    minutes = calculate_min_trip(trip.finish_time,trip.initial_time)
    fare = (3500 + (kms * 1000) + (minutes * 200))
    trip = DB["UPDATE trips SET fare = '#{fare}' WHERE id = #{id}"]
    return "fare is #{fare}!"
end
