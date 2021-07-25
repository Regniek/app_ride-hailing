# app_ride-hailing



## Connect with postgres
postgres://<user_postgres>:<password_postgres>@localhost:5432/<name_table>'
## Create database in postgres

CREATE DATABASE ride_hailing;
\c ride_hailing
CREATE TABLE drivers (id SERIAL, name VARCHAR(20),number_plate VARCHAR(10), vehicle_color VARCHAR(20), brand VARCHAR(20), phone VARCHAR(20),PRIMARY KEY (id));
CREATE TABLE riders (id SERIAL, name VARCHAR(20),phone VARCHAR(20),PRIMARY KEY (id));
CREATE TABLE trips (id SERIAL, driver_id int NOT NULL, rider_id int NOT NULL, initial_latitude FLOAT(8), initial_longitude FLOAT(8),initial_time TIMESTAMP, finish_time TIMESTAMP, finish_latitude FLOAT(8), finish_longitude FLOAT(8), fare FLOAT, fee_paid BOOLEAN NOT NULL,CONSTRAINT fk_rider_id FOREIGN KEY (rider_id) REFERENCES riders (id),CONSTRAINT fk_driver_id FOREIGN KEY (driver_id) REFERENCES drivers (id));


## Install the gems needed

bundle install