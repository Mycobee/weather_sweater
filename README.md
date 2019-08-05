## Weather Sweater

This is the base repo for a RESTful weather API that consumes multiple APIs to render data.  It consumes the Flickr API, the Google Directions API, the Google Geocoding API, and the DarkSky weather API. 

Project Spec and Evaluation Rubric: https://github.com/turingschool-examples/sweater-weather

## About the Project

This is a Ruby on Rails API project that consumes from multiple other APIs to create weather data based on location.  The app contains endpoints that are used to render weather based on trip times and location, weather based on location, user account creation and login.  

### Run the Tests

Clone down the repo

$ git clone
Install the gem packages

$ bundle install
Install node packages for stimulus

$ brew install node
$ brew install yarn
$ yarn add stimulus
Set up the database

$ rake db:create
$ rake db:migrate
$ rake db:seed
Run the test suite:

$ bundle exec rspec

### Technologies

Rails
Ruby
Caching
Fast Json API

