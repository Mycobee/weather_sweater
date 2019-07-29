class ForecastGenerator
	def initialize(params)
		@params = params
	end

	def get_forecast
		coords = GoogleGeocodingService.new(@params).get_coords
		forecast_data = DarkSkyService.new(coords).get_forecast
		Forecast.new(forecast_data)
	end
end

