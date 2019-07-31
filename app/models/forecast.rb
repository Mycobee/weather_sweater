class Forecast
	attr_reader :id

	def initialize(forecast_data)
		@forecast_data = forecast_data
	end

	def current_weather
		{current: { high: daily_high(today),
		 low: daily_low(today),
		 temp: current_temp,
		 summary: current_summary }}
	end
	
	def today
		@forecast_data[:daily][:data][0]
	end
	
	def currently
		@forecast_data[:currently]
	end

	def current_temp
		currently[:temperature]
	end

	def current_summary
		currently[:summary]
	end

	def daily_forecasts
		{	five_day:	1.upto(5).map do |num|
			daily_forecast(@forecast_data[:daily][:data][num]) 
		end }
	end

	def daily_forecast(day)
		{daily:	{ high: daily_high(day),
			low: daily_low(day),
			time: daily_time(day),
			precip_chance: daily_precip_chance(day),
			summary: daily_summary(day) }}
	end

	def daily_high(day)
		day[:temperatureHigh]
	end

	def daily_low(day)
		day[:temperatureLow]
	end

	def daily_time(day)
		Time.at(day[:time])
	end

	def daily_precip_chance(day)
		day[:precipProbability] * 100
	end

	def daily_summary(day)
		day[:summary]
	end

	def today_details
		{daily_details: { summary: daily_summary(today),
			feels_like: feels_like,
			humidity: current_humidity,
			visibility: current_visibility,
			uv_index: current_uv }}
	end

	def feels_like
		currently[:apparentTemperature]
	end	

	def current_humidity
		currently[:humidity]
	end

	def current_visibility
		currently[:visibility]
	end
	
	def current_uv
		currently[:uvIndex]
	end

	def hourly_forecasts
		hourlies = Hash.new(0)
		1.upto(8).each do |num|
			hourlies[Time.at(@forecast_data[:hourly][:data][num][:time])] =
			@forecast_data[:hourly][:data][num][:temperature]
		end
		{hourly_forecasts: hourlies}
	end
end
