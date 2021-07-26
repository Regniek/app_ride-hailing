require 'sinatra'
require "sinatra/activerecord"
set :database_file, "config/database.yml"
require './controllers/drivers_controller.rb'
require './controllers/riders_controller.rb'
require './controllers/trips_controller.rb'

get "/" do
    "hello world"
end

class RideHailing < Sinatra::Base

    register Sinatra::ActiveRecordExtension

    get "/" do
      "hello world"
    end

    get '/api/riders' do
        show_riders
    end

    post '/api/riders' do
        data = JSON.parse(request.body.read)
        create_rider(data["name"],data["phone"])
    end

    get '/api/drivers' do
        show_drivers
    end

    post '/api/drivers' do
        data = JSON.parse(request.body.read)
        create_driver(data["name"],data["phone"],data["number_plate"],data["vehicle_color"],data["brand"])
    end


    post '/api/trips/start' do
        data = JSON.parse(request.body.read)
        start_trip(data["rider_id"], data["initial_latitude"], data["initial_longitude"], data["finish_latitude"], data["finish_longitude"])
    end

    put '/api/trips/finish' do
        data = JSON.parse(request.body.read)
        finish_trip(data["trip_id"], data["finish_latitude"], data["finish_longitude"])
    end

    put '/api/trips/fare' do
        data = JSON.parse(request.body.read)
        calculate_fare(data["trip_id"])
    end
end