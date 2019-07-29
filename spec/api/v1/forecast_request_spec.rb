# frozen_string_literal: true

require 'rails_helper'

describe 'forecast api' do
  it 'sends the forecast for my city' do
    get '/api/v1/forecast?location=denver,co'

    expect(response).to be_successful
  end
end
