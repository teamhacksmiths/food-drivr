class DriverSerializer < ActiveModel::Serializer
  attributes :id, :phone, :name, :email, :avatar, :created_at, :updated_at
end
