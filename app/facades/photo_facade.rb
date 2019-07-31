class PhotoFacade 
	def initialize(params)
		@params = params
		@city = params['city']
	end
	
	def format_photos
		{ photos: instantiate_photos,
			city: @city
		}
	end
	
	def instantiate_photos
		get_photos.map do |photo|
			Photo.new(photo)
		end	
	end

	def get_photos
		Rails.cache.fetch("photos_cache", expires_in: 15.hours) do
			FlickrService.new(@params).get_photos
		end
	end
end
