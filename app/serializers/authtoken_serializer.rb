class AuthtokenSerializer < ActiveModel::Serializer
  attributes :auth_token
  type "authtoken"
end
