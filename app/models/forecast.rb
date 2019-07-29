class Forecast
	def initialize(forecast_data)
		@forecast_data = forecast_data
	end

	def build_forecast
		current_weather
		#today_details
		#daily_forecasts
		#hourly_forecasts
	end

	def current_weather
		[daily_high(today),
		 daily_low(today),
		 current_temp,
		 overview]
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

	def daily_forecast(day)
		[daily_high(day),
		daily_low(day),
		daily_time(day),
		daily_precip_chance(day),
		daily_summary(day)]
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
		[daily_summary(today),
		feels_like,
		current_humidity,
		current_visibility,
		current_uv]
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
		1.upto(8).map do |num|
			[@forecast_data[:hourly][:data][num][:temperature],
			@forecast_data[:hourly][:data][num][:time]]	
		end
	end
end
