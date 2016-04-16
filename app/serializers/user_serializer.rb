class UserSerializer < ActiveModel::Serializer
  attributes :id, :phone, :expiration, :description, :name, :email, :avatar, :role_id
  has_one :setting

end
