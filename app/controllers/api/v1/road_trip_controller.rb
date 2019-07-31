class Api::V1::RoadTripController < ApplicationController
	def create
	 trip_facade = RoadTripFacade.new(road_trip_params)
	 render json: trip_facade.get_forecast
	end
	
	private 

	def road_trip_params
		params.permit(:origin, :destination, :api_key)
	end
end

