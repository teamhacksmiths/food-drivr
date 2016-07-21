class PickupSerializer < ActiveModel::Serializer
  type "pickup"
  attributes :estimated, :actual, :address, :latitude, :longitude
end
