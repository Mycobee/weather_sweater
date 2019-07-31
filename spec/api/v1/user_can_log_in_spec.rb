require 'rails_helper'

describe "login api"do
	it "it allows a user to log in" , type: :request do
		api_key = ApiKey.new.key
		user = User.create(email: "whatever@example.com", password: 'password', api_key: api_key)

		login_creds = {
  		"email": "whatever@example.com",
  		"password": "password"
		}

		post '/api/v1/sessions', params: login_creds
		expect(response).to be_successful
		returned_key = JSON.parse(response.body, symbolize_names: true)[:data][:attributes][:api_key]
		expect(returned_key).to eq(api_key)
	end

	it "renders 404 if the request isn't successful" do
		api_key = ApiKey.new.key
		user = User.create(email: "whatever@example.com", password: 'password', api_key: api_key)

		login_creds = {
  		"email": "whatever@example.com",
  		"password": "psswrd"
		}
		expect{post '/api/v1/sessions', params: login_creds}.to raise_error(ActionController::RoutingError)
	end
end
