# frozen_string_literal: true

# service for getting spotify user songs
class GoogleDirectionsService
  def initialize(params)
    @start = params['start'].gsub(',', ',+')
    @end = params['end'].gsub(',', ',+')
  end
 
  def get_trip
    params = { key: ENV['GEOCODING_API_KEY'], origin: @start, destination: @end }
    url = '/maps/api/directions/json'
    get_json(url, params)[:results]
  end

 private 

  def get_json(url, params = {})
    response = conn.get(url, params)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new('https://maps.googleapis.com') do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end
end

