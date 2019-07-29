# frozen_string_literal: true

# service for getting spotify user songs
class GoogleGeocodingService
  def initialize(params)
    @location = params['location'].gsub(',', ',+')
  end
 
  def get_coords
    params = { key: ENV['GEOCODING_API_KEY'], address: @location }
    url = '/maps/api/geocode/json'
    get_json(url, params)[:results].first[:geometry][:location]
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
