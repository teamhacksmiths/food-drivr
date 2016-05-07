class DriverSerializer < ActiveModel::Serializer
  attributes :id, :phone, :name, :email, :avatar
end
