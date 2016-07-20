class DonorSerializer < ActiveModel::Serializer
  attributes :id, :phone, :name, :email, :avatar, :company
end
