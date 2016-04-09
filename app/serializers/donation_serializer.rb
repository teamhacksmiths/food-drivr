class DonationSerializer < ActiveModel::Serializer
  attributes :id, :description, :created_at, :updated_at
  has_one :donor
  has_one :driver
  has_one :recipient
end
