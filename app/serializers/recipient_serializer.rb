class RecipientSerializer < ActiveModel::Serializer
  attributes :id, :name, :phone, :address, :latitude, :longitude
end
