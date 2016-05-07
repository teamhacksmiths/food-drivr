class DonorSerializer < ActiveModel::Serializer
  attributes :id, :phone, :name, :email, :avatar
  has_many :addresses
end
