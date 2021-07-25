require './config/database.rb'


def show_riders
    riders = DB[:riders]
    return riders.all.to_json
end

def create_rider(name,phone)
    rider = DB["INSERT INTO riders (name, phone) VALUES (?, ?)",name, phone]
    rider.insert(1)
    return "Rider added"
end