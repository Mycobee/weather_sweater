class CreateUserFacade
	def initialize(user_params)
		@new_user = User.new(user_params)
		@password_confirmation = user_params[:password_confirmation]
		@password = user_params[:password]
	end
	
	def valid_user?
		if @new_user.save
			return true
		else 
			return false	
		end
	end

	def assign
		@new_user.api_key = ApiKey.new.key
		{ api_key: @new_user.api_key }
	end	
end

