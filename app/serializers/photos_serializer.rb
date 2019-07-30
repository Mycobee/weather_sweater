class PhotosSerializer
  include FastJsonapi::ObjectSerializer
  attributes :photo, :city, :id
end
