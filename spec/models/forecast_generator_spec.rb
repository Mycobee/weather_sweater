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

		it "generates a forecast hash" do
			expect(@generator.get_forecast).to eq("denver,co")
		end
	end
end
