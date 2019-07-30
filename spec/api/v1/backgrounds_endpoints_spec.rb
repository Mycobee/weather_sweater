require 'rails_helper'

describe "background api" do
	it "sends the background image for requested city" do
		VCR.use_cassette('backgrounds_request') do
			get '/api/v1/backgrounds?location=denver,co'

			expect(response).to be_successful
			
			results = JSON.parse(response.body, symbolize_names: true)
			expect(results[:photos]).to be_a(Array)
			expect(results[:photos][0][:title]).to eq('Uptown Denver')
		end	
	end
end

