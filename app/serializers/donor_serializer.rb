class DonorSerializer < ActiveModel::Serializer
  type "donor"
  attributes :id, :phone, :name, :email, :avatar, :company
end
