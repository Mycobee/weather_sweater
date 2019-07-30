class Api::V1::UsersController < ApplicationController
	def create
		create_facade = CreateUserFacade.new(user_params)
		if create_facade.valid_user?
			render json: create_facade.assign.to_json
		else
			not_found
		end
	end

	private
	
	def user_params
		params.permit(:email, :password, :password_confirmation)
	end
end
