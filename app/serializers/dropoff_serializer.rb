class DropoffSerializer < ActiveModel::Serializer
  type "dropoff"
  attributes :estimated, :actual, :address, :latitude, :longitude
end
