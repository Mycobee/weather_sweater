class Api::V1::MunchiesController < ApplicationController
	def index
	 trip_time = GoogleDirectionsService.new(params).get_trip[:routes][0][:legs][0][:duration][:value]
	# do the yelp things??
	#
		conn = Faraday.new('yelp') do |faraday|
			faraday.adapter Faraday.default_adapter
			faraday.headers['Authorization'] = 'Bearer ' + ENV['YELP_API_TOKEN']
		end
		
		
	end
end

