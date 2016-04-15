class DonationSerializer < ActiveModel::Serializer
  attributes :id, :description, :created_at, :updated_at, :participants
  has_one :pickup
  has_one :dropoff
  has_one :recipient
  has_many :donation_types

  def participants
    { :donor => donor, :driver => driver}
  end
  def donor
    DonorSerializer.new(object.donor).attributes
  end
  def driver
    DriverSerializer.new(object.driver).attributes
  end
end
