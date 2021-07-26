# app_ride-hailing

this API allows generating the request to start a trip and allows the driver to finish the trip and put automatic fare. 

follow the next steps for install and execution.

this API is create in sinatra, with sequel for handling the database and active record it's use for integrate with heroku.

[ride-hailing App](https://ride-hailing.herokuapp.com/)

## Connect with postgres

### config .env file

USER_PG= user postgres
PASS_PG= password postgres
DB_PG= database name in postgres

## Create database in postgres

CREATE DATABASE ride_hailing;


## Install the gems needed

run
```
bundle install
```

## Run Rake

```
rake db:create
```

next step

```
rake db:migrate
```

## Run Test

use in your console
```
ruby test/test.rb
```
## Run App

use in your console 
```
ruby server.rb
```

## Doc in postman about the endpoints

[In this link you find the posible methods and the body for respective request](https://documenter.getpostman.com/view/12073893/TzsbK755)


