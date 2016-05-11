class PickupSerializer < ActiveModel::Serializer
  attributes :estimated, :actual, :address, :latitude, :longitude
end
