class Photo
	def initialize(attrs)
		@id 			= attrs[:id]
  	@owner	 	=	attrs[:owner]
  	@secret	  =	attrs[:secret]
  	@server	  =	attrs[:server]
  	@farm	  	=	attrs[:farm]
  	@title	  =	attrs[:title]
  	@ispublic =	attrs[:ispublic]
  	@isfriend =	attrs[:isfriend]
  	@isfamily =	attrs[:isfamily]
	end
end
