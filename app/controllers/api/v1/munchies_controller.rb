class Api::V1::MunchiesController < ApplicationController
	def index
		trip_time = GoogleDirectionsService.new(params).get_trip[:routes][0][:legs][0][:duration][:value]
		response = YelpService.new(params, trip_time).get_businesses
		businesses = 0.upto(2).map do |index|
			Business.new(response[:businesses][index], params['end'])
		end	
		render json: businesses, each_serializer: BusinessSerializer 
	end
end

