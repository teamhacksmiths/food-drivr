class UserWithAuthTokenSerializer < ActiveModel::Serializer
  attributes :id, :expiration, :auth_token, :name, :email, :role_id
end
