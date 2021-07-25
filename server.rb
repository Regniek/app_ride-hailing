require 'sinatra'
require './controllers/drivers_controller.rb'
require './controllers/riders_controller.rb'


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
