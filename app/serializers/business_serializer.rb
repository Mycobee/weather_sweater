class BusinessSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :address
end
