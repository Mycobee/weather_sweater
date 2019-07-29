class Api::V1::MunchiesController < ApplicationController
	def index
	 trip_time = GoogleDirectionsService.new(params).get_trip[:routes][0][:legs][0][:duration][:value]
 binding.pry
		conn = Faraday.new('https://api.yelp.com/') do |faraday|
			faraday.adapter Faraday.default_adapter
			faraday.headers['Authorization'] = 'Bearer ' + ENV['YELP_API_TOKEN']
		end
		
		x = conn.get do |req|
			req.url '/v3/businesses/search'
			req.params['location'] = params[:end]
			req.params['open_at'] =	Time.now.to_i + (trip_time * 1000) 
		end	
	end
end

