class UserSerializer
  include FastJsonapi::ObjectSerializer

  attributes :email, :phone_number, :country, :parcel_weight
end
