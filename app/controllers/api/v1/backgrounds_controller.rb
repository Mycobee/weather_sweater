class Api::V1::BackgroundsController < ApplicationController
	def index
		photo_facade = PhotoFacade.new(params).format_photos	
		render json: photo_facade.to_json 
	end
end

