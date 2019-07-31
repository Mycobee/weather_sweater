require 'rails_helper'

describe Forecast, type: :model do
	before :each do
		VCR.use_cassette('forecast_spec') do
			params = { "location" => "denver,co" }
			coords = GoogleGeocodingService.new(params).get_coords
			@forecast_hash = DarkSkyService.new(coords).get_forecast 
			@forecast = Forecast.new(@forecast_hash)
		end
	end

	describe "instance methods" do
		it "#current_weather" do
			today = @forecast_hash[:daily][:data][0]
			expected = { current: { high: @forecast.daily_high(today), low: @forecast.daily_low(today), temp: @forecast.current_temp, summary: @forecast.current_summary }}
			expect(@forecast.current_weather).to eq(expected)
		end


		it "daily_forecast" do
			day = @forecast_hash[:daily][:data][1]
			expected = {daily: { high: @forecast.daily_high(day), low: @forecast.daily_low(day), time:  @forecast.daily_time(day), precip_chance: @forecast.daily_precip_chance(day), summary: @forecast.daily_summary(day)}}

			expect(expected).to eq(@forecast.daily_forecast(day))
		end

		it 'today_details' do
			day = @forecast_hash[:daily][:data][0]
 
			expected = { daily_details: { summary: @forecast.daily_summary(day), feels_like: @forecast.feels_like, humidity: @forecast.current_humidity, visibility: @forecast.current_visibility, uv_index: @forecast.current_uv}}
		
			expect(expected).to eq(@forecast.today_details)
		end

		xit "hourly_forecasts" do
			expect(expected).to eq(@forecast.hourly_forecasts)
		end

		it "#daily_low" do
			day = @forecast_hash[:daily][:data][1]
			expect(@forecast.daily_low(day)).to eq(67.02)
		end
		
		it "#daily_high" do
			day = @forecast_hash[:daily][:data][1]
			expect(@forecast.daily_high(day)).to eq(92.75)
		end

		it "#current_temp" do
			expect(@forecast.current_temp).to eq(92.06)
		end

		it "#current_summary" do
			expect(@forecast.current_summary).to eq("Mostly Cloudy")
		end

		it "#daily_summary" do
			day = @forecast_hash[:daily][:data][1]
			expect(@forecast.daily_summary(day)).to eq("Partly cloudy throughout the day.")
		end

		it "#today" do
			today = @forecast_hash[:daily][:data][0]
			expect(@forecast.today).to eq(today)
		end

		it "#current_visibility" do
			expect(@forecast.current_visibility).to eq(2.576)
		end

		it "#current_humidity" do
			expect(@forecast.current_humidity).to eq(0.21)
		end

		it "#current_uv" do
			expect(@forecast.current_uv).to eq(6)
		end

		it "#feels_like" do
			expect(@forecast.feels_like).to eq(92.06)
		end
	
		xit "#daily_time" do

		end
	end
end

