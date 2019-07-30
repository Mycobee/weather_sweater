require 'rails_helper'

describe "background api" do
	it "sends the background image for requested city" do
		get '/api/v1/backgrounds?location=denver,co'

		expect(response).to be_successful
		
			
		#This will search the Flickr API or any other images API for images associated with the location. This may not return images as intended, you can feel free to add search terms to your query to the Flickr API such as Parks or nature or skyline or whatever in order to return more appropriate images.
	end
end

