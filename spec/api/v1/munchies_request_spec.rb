require 'rails_helper'

describe "I send a request to munchies api with trip route and food desired" do
		before :each do
		
		end
		
		it "returns all the shops of that flavor that will be open" do
			get "/api/v1/munchies?start=denver,co&end=pueblo,co&food=chinese"	

			expect(response).to be_successful
		end
end

