require 'rails_helper'

describe "create account api"do
	it "it allows a user to create an acct" , type: :request do
		user = {
			"email": "whatever@example.com", 
			"password": "password",
			"password_confirmation": "password"
		}

		post '/api/v1/users', params: user
		expect(response).to be_successful
		key = JSON.parse(response.body)	
		user = User.last	
		expect(user.email).to eq("whatever@example.com")	
	end

	it "renders 404 if the request isn't successful" do
		user = {
			"email": "whatever@example.com", 
			"password": "password",
			"password_confirmation": "psswrd"
		}

		expect{post '/api/v1/users', params: user}.to raise_error(ActionController::RoutingError)
	end
end
