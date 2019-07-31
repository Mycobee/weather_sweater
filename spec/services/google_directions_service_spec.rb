require 'rails_helper'

describe GoogleDirectionsService do
	describe "get trip" do
		it "returns trip times and information" do
			VCR.use_cassette('services/google_directions_service_cassette.rb') do
				params = { 'start'=>'denver,co', 'end'=>'pueblo,co' }
 				trip_data = GoogleDirectionsService.new(params).get_trip

				expect(trip_data[:routes]).to be_a(Array)
				expect(trip_data[:routes][0][:legs][0][:distance][:value]).to be_a(Integer)
			end
		end
	end
end


