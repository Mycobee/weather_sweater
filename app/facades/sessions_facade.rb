class SessionsFacade
	attr_reader :id
	def initialize(login_params)
		@id = 1
		@email = login_params[:email]	
		@password = login_params[:password]	
		@user =	User.find_by(email: @email) 
	end
	
	def valid_user?
		@user && @user.authenticate(@password)
	end

	def return_id
		@user.id	
	end

	def return_key
		@user.api_key
	end
end
