require 'rails_helper'

describe Forecast, type: :model do
	before :each do
		params = { "location" => "denver,co" }
		coords = GoogleGeocodingService.new(params).get_coords
		@forecast_hash = DarkSkyService.new(coords).get_forecast 
		@forecast = Forecast.new(@forecast_hash)
	end

	describe "instance methods" do
		xit "#current_weather" do
			expected = [@forecast.daily_high, @forecast.daily_low, @forecast.current_temp, @forecast.current_summary] 
			expect(@forecast.current_weather).to eq(expected)
		end


		xit "daily_forecast" do
			day = @forecast_hash[:daily][:data][1]
			expected = [@forecast.daily_high(day), @forecast.daily_low(day), @forecast.daily_time(day), @forecast.daily_precip_chance(day), @forecast.daily_summary(day)]

			expect(expected).to eq(@forecast.daily_forecast(day))
		end

		xit 'today_details' do
			day = @forecast_hash[:daily][:data][0]
 
			expected = [@forecast.daily_summary(day), @forecast.feels_like, @forecast.current_humidity, @forecast.current_visibility, @forecast.current_uv]
		end

		it "hourly_forecasts" do
		end

#		xit "#daily_low" do
#			expect(expected).to eq(actual)
#		end
#		
#		xit "#daily_high" do
#			expect(expected).to eq(actual)
#		end
#
#		xit "#current_temp" do
#		end
#
#		xit "#overview" do
#		end
#
#		xit "#today" do
#		end
	end
end

