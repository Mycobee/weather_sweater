require 'rails_helper'

describe ForecastGenerator, type: :model do
		before :each do
			VCR.use_cassette("forecast_generator") do
				attrs = { "location"=>"denver,co" }
				@generator = ForecastGenerator.new(attrs)
			end
		end
		
		it "exists" do
			VCR.use_cassette("forecast_generator") do
				expect(@generator).to be_a ForecastGenerator
			end
		end

		it "generates a forecast hash" do
			VCR.use_cassette("forecast_generator") do
				expected = @generator.get_forecast
				expect(expected).to be_a(Forecast)
			end
		end
end
