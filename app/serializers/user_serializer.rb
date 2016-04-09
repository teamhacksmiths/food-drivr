class UserSerializer < ActiveModel::Serializer
  attributes :id, :phone, :name, :email, :created_at, :updated_at, :auth_token
  has_one :setting
end
