require 'rails_helper'

describe "I send a request to munchies api with trip route and food desired" do
	it "returns all the shops of that flavor that will be open" do
		get "/api/v1/munchies?start=denver,co&end=pueblo,co&food=chinese"	

		expect(response).to be_successful
		
		results = JSON.parse(response.body)
		expect(results.count).to eq(3)
		expect(results[0]).to have_key("name")
		expect(results[0]).to have_key("address")
	end
end

