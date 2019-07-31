require 'rails_helper'

describe "road trip api" do
		it "takes a start and end destination and returns weather for that time" do
			VCR.use_cassette('authorized_road_trip') do
   			allow(Time).to receive(:now).and_return(Time.at(1564423200))
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
				expect(data["summary"]).to eq("Clear")
				expect(data["expected_temp"]).to eq(90.31)
				expect(data["travel_time"]).to eq("01:46:53")
			end
		end

		it "sends a 401 with bad api_key" do
			VCR.use_cassette('unauthorized_road_trip') do
   			allow(Time).to receive(:now).and_return(Time.at(1564423200))
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
end

