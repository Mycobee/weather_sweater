require 'rails_helper'

describe ForecastGenerator, type: :model do
	describe "" do
		before :each do
			attrs = { "location"=>"denver,co" }
			@generator = ForecastGenerator.new(attrs)	
		end
		
		it "exists" do
			expect(subject).to be_a ForecastGenerator	
		end

		it "creates a location" do
			expect(@generator.location).to eq("denver,co")
		end
	end
end

