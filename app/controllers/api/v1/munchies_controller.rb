class Api::V1::MunchiesController < ApplicationController
	def index
	 trip_time = GoogleDirectionsService.new(params).get_trip[:routes][0][:legs][0][:duration][:value]
		conn = Faraday.new('https://api.yelp.com') do |faraday|
			faraday.adapter Faraday.default_adapter
			faraday.headers['Authorization'] = 'Bearer ' + ENV['YELP_API_TOKEN']
		end
		
		response = conn.get do |req|
			req.url '/v3/businesses/search'
			req.params['location'] = params[:end]
			req.params['open_at'] =	Time.now.to_i + trip_time.seconds  
			req.params['categories'] = params['food']
		end	
	
		business_data = JSON.parse(response.body, symbolize_names: true)
		### dream a poro to do the logic sifting BusinessPlucker.new(business_data)
		 binding.pry 
		0.upto(2).each do |index|

		end	
	end
end

