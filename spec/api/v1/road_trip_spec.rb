require 'rails_helper'

describe "road trip api" do
		xit "takes a start and end destination and returns weather for that time" do
			VCR.use_cassette('authorized_road_trip', allow_playback_repeats: true) do
				api_key = ApiKey.new.key
				user = User.create(email: "whatever@example.com", password: 'password', api_key: api_key)
				road_trip = {
  				"origin": "Denver,CO", 
  				"destination": "Pueblo,CO",
  				"api_key": api_key
				}

				headers = {
      		'CONTENT_TYPE' => 'application/json',
      		'ACCEPT' => 'application/json'
    		}

				post "/api/v1/road_trip", params: road_trip.to_json, headers: headers
				data = JSON.parse(response.body)["data"]
				expect(data["summary"]).to eq("Partly Cloudy")
				expect(data["expected_temp"]).to eq(93.45)
				expect(data["travel_time"]).to eq(data)
			end
		end

		xit "sends a 401 with bad api_key" do
			WebMock.allow_net_connect!
			VCR.turn_off!
			api_key = ApiKey.new.key
			user = User.create(email: "whatever@example.com", password: 'password', api_key: 123456)
			road_trip = {
  			"origin": "Denver,CO", 
  			"destination": "Pueblo,CO",
  			"api_key": api_key
			}

			headers = {
      	'CONTENT_TYPE' => 'application/json',
      	'ACCEPT' => 'application/json'
    	}

			post "/api/v1/road_trip", params: road_trip.to_json, headers: headers
			errors = JSON.parse(response.body)["errors"]
			expect(errors[0]["status"]).to eq("401")
			expect(errors[0]["title"]).to eq("Unauthorized")
		end
end

