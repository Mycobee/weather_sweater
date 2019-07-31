require 'rails_helper'

describe FlickrService do
	describe "photo search" do
		it "returns photo data" do
			VCR.use_cassette('services/flickr_service_cassette') do
				params = {
					'location' => 'denver,co'
				}

				
 				image_data = FlickrService.new(params).get_photos
				expect(image_data).to be_a(Array)
				expect(image_data[0][:id]).to be_a(String)
				expect(image_data[0][:title]).to be_a(String)
			end
		end
	end
end


