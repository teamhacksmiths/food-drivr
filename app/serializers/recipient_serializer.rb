class RecipientSerializer < ActiveModel::Serializer
  type "recipient"
  attributes :id, :name, :phone, :address, :latitude, :longitude
end
