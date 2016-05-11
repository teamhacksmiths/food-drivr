class DropoffSerializer < ActiveModel::Serializer
  attributes :estimated, :actual, :address, :latitude, :longitude
end
