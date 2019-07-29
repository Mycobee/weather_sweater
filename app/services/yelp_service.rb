# frozen_string_literal: true

# service for getting spotify user songs
class YelpService
  def initialize(params)
    @location = params[:end] 
		@trip_time = trip_time.seconds
		@categories = params['food']
  end
 
  def get_businesses
    params = { location: @location, open_at: (Time.now.to_i + @trip_time), categories: @categories }
    url = "/v3/businesses/search"
    get_json(url, params)
  end

 private 

  def get_json(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
		conn = Faraday.new('https://api.yelp.com') do |faraday|
			faraday.adapter Faraday.default_adapter
			faraday.headers['Authorization'] = 'Bearer ' + ENV['YELP_API_TOKEN']
		end
  end
end

