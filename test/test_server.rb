ENV['APP_ENV'] = 'test'

require './server.rb'
require 'test/unit'
require 'rack/test'

class RideHailingTest < Test::Unit::TestCase
    include Rack::Test::Methods
    def app
      Sinatra::Application
    end
    def test_it_create_rider
        rider_data = {
            'name' => 'Juan',
            'phone' => '+573113000102'
        }
        post '/riders',rider_data.to_json, "CONTENT_TYPE" => "application/json"
        assert last_response.ok?
        assert_equal 'Rider added', last_response.body 
    end
    def test_it_create_driver
        driver_data = {
            'name' => 'Juan',
            'phone' => '+573113000102',
            'number_plate' => 'UFD012',
            'vehicle_color' => 'Blue',
            'brand' => 'Renault'
        }
        post '/drivers',driver_data.to_json, "CONTENT_TYPE" => "application/json"
        assert last_response.ok?
        assert_equal 'Driver added', last_response.body 
    end

end