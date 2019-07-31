class SessionsSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id
	
	attribute :api_key do |object|
		object.return_key
	end
end
