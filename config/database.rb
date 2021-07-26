require 'sequel'
require 'dotenv'
Dotenv.load

DB =  Sequel.connect("postgres://#{ENV['USER_PG']}:#{ENV['PASS_PG']}@localhost:5432/#{ENV['DB_PG']}")