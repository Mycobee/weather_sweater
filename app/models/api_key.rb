class ApiKey
	attr_reader :key

	def initialize
		@key = SecureRandom.base64(10)			
	end
end
