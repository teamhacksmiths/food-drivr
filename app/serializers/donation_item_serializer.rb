class DonationItemSerializer < ActiveModel::Serializer
  attributes :type_description, :unit, :quantity
end
