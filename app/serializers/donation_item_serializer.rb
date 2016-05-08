class DonationItemSerializer < ActiveModel::Serializer
  attributes :description, :unit, :quantity
end
