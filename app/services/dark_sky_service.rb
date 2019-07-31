# frozen_string_literal: true

# service for getting spotify user songs
class DarkSkyService
  def initialize(coords)
    @coords = coords[:lat].to_s + "," + coords[:lng].to_s
  end
 
  def get_forecast
    url = "/forecast/#{ENV['DARKSKY_API_KEY']}/#{@coords}"
    get_json(url)
  end

	def get_future_forecast(seconds)
		time = (Time.now.to_i +	seconds.seconds).to_s
		url = "/forecast/#{ENV['DARKSKY_API_KEY']}/#{@coords + ',' + time}"
    get_json(url)
	end

 private 

  def get_json(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new('https://api.darksky.net') do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end
end
