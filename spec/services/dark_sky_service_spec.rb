require 'rails_helper'

describe DarkSkyService do
	describe "forecasts" do
		it "returns forcasts data" do
			VCR.use_cassette('services/dark_sky_cassette') do
				coords = { :lat=>39.7392358, :lng=>-104.990251 }
 				forecast_data = DarkSkyService.new(coords).get_forecast
				expect(forecast_data[:currently][:time]).to be_a(Integer)
				expect(forecast_data[:currently][:summary]).to be_a(String)
			end
		end
	end
end

