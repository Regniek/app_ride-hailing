require 'sinatra'
require './controllers/drivers_controller.rb'
require './controllers/riders_controller.rb'
require './controllers/trips_controller.rb'

get '/riders' do
    show_riders
end

post '/riders' do
    data = JSON.parse(request.body.read)
    create_rider(data["name"],data["phone"])
end

get '/drivers' do
    show_drivers
end

post '/drivers' do
    data = JSON.parse(request.body.read)
    create_driver(data["name"],data["phone"],data["number_plate"],data["vehicle_color"],data["brand"])
end


post '/trips/start' do
    data = JSON.parse(request.body.read)
    start_trip(data["rider_id"], data["initial_latitude"], data["initial_longitude"], data["finish_latitude"], data["finish_longitude"])
end

put '/trips/finish' do
    data = JSON.parse(request.body.read)
    finish_trip(data["trip_id"], data["finish_latitude"], data["finish_longitude"])
end