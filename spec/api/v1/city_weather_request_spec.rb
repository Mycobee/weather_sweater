# frozen_string_literal: true

require 'rails_helper'

describe 'forecast api' do
  it 'sends the forecast for requested city' do
		VCR.use_cassette('city_weather_request') do
    	get '/api/v1/forecast?location=denver,co'

    	expect(response).to be_successful
			
			forecast = JSON.parse(response.body)
		end
  end
end
