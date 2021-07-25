require './config/database.rb'

def show_drivers
    drivers = DB[:drivers]
    return drivers.all.to_json
end

def create_driver(name, phone, number_plate, vehicle_color, brand)
    driver = DB["INSERT INTO drivers (name, phone, number_plate, vehicle_color, brand) VALUES (?, ?, ?, ?, ?)",name, phone, number_plate, vehicle_color, brand]
    driver.insert(1)
    return "Driver added"
end