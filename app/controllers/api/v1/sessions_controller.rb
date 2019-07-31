class Api::V1::SessionsController < ApplicationController
	def create
		session_facade = SessionsFacade.new(login_params)
		if session_facade.valid_user?
			session[:user_id] = session_facade.return_id
			render json: SessionsSerializer.new(session_facade)	
		else
			not_found
		end	
	end

	private
	
	def login_params
		params.permit(:email, :password)
	end
end

