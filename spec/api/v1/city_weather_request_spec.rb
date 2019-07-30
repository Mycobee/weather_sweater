# frozen_string_literal: true

require 'rails_helper'

describe 'forecast api' do
  it 'sends the forecast for requested city' do
    get '/api/v1/forecast?location=denver,co'

    expect(response).to be_successful
		
		forecast = JSON.parse(response.body)
		#5 day forecast
		#daily high and low for every day
  end
end
