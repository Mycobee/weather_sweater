class ForecastGenerator
	def initialize(params)
		@params = params
	end

	def get_forecast
		coords = GoogleGeocodingService.new(@params).get_coords
		DarkSkyService.new(coords).get_forecast
		Forcast.new(forecast_data)
	end
end

