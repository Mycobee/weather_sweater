require 'rails_helper'

describe "create account api" do
	it "it allows a user to create an acct" do
		post '/api/v1/users?email=whatever@example.com&password=password&password_confirmation=password'			
	
		expect(response).to be_successful
		
	end
end
