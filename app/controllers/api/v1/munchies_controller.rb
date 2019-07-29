class Api::V1::MunchiesController < ApplicationController
	def index
	 trip_time = GoogleDirectionsService.new(params).get_trip[:routes][0][:legs][0][:duration][:value]
	 response = YelpService.new(params).search_businesses
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
		businesses = []

		0.upto(2).each do |index|
			businesses <<	Business.new(business_data[:businesses][index], params['end'])
		end	

		render json: businesses, each_serializer: BusinessSerializer 
	end
end

