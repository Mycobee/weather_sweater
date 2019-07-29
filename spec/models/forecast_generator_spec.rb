require 'rails_helper'

describe ForecastGenerator, type: :model do
		before :each do
			attrs = { "location"=>"denver,co" }
			@generator = ForecastGenerator.new(attrs)
		end
		
		it "exists" do
			expect(@generator).to be_a ForecastGenerator
		end

		it "generates a forecast hash" do
			expected = @generator.get_forecast
			expect(expected).to be_a(Forecast)
		end
end
