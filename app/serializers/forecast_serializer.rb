class ForecastSerializer
  include FastJsonapi::ObjectSerializer
	attributes :complete_forecast do |forecast|
		{data: [forecast.current_weather, 
						forecast.today_details,
						forecast.daily_forecasts,
						forecast.hourly_forecasts]}
	end
end
