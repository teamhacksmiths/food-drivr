class DriverSerializer < ActiveModel::Serializer
  type "driver"
  attributes :id, :phone, :name, :email, :avatar
end
