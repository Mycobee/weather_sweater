# frozen_string_literal: true

# service for getting spotify user songs
class FlickrService
  def initialize(params)
		@api_key = ENV['FLICKR_API_KEY']
    @text = params['location']
		@method = 'flickr.photos.search'
		@format = 'json'
		@nojsoncallback = '1'
  end
 
  def get_photos
    params = { api_key: @api_key, text: @text, method: @method, format: @format, nojsoncallback: @nojsoncallback }
    url = '/services/rest'
    get_json(url, params)[:photos][:photo]
  end

 private 

  def get_json(url, params = {})
    response = conn.get(url, params)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
		Faraday.new('https://api.flickr.com') do |faraday|
			faraday.adapter Faraday.default_adapter 
		end
  end
end

