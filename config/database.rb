require 'sequel'
require 'dotenv'
Dotenv.load

DB =  Sequel.connect("postgres://#{ENV['USER_PG']}:#{ENV['PASS_PG']}@#{ENV['PORT']}/#{ENV['DB_PG']}")