class ForecastGenerator
	attr_reader :location

	def initialize(params)
		@location = params['location']
	end

	def get_forecast
		coords = GoogleGeocodingService.new(location).get_coords
		DarkSkyService.new.get_forecast(coords)
	end
end

