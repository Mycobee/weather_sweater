require 'rails_helper'

describe GoogleGeocodingService do
	describe "google geocoding coordinate request" do
		it "returns geocordinate data" do
			VCR.use_cassette('services/google_geocordinate_service_cassette.rb') do
				params = { 'location' => 'denver,co' }
 				coordinate_data = GoogleGeocodingService.new(params).get_coords

				expect(coordinate_data[:lat]).to be_a(Float)
				expect(coordinate_data[:lng]).to be_a(Float)
			end
		end
	end
end



