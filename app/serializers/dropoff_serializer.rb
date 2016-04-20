class DropoffSerializer < ActiveModel::Serializer
  attributes :estimated, :actual, :latitude, :longitude, :street_address, :street_address_two, :city, :state, :zip, :dropoffstatus
end
