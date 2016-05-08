class DonationSerializer < ActiveModel::Serializer
  attributes :id, :description, :created_at, :updated_at, :status_id, :status, :participants
  has_one :pickup
  has_one :dropoff
  has_one :recipient

  has_many :items
  has_many :donation_types
  has_many :images

  def status
    { :id => object.status.id, :description => object.status.name }
  end

  def participants
    { :donor => donor, :driver => driver }
  end
  def donor
    DonorSerializer.new(object.donor).attributes if object.donor
  end
  def driver
    DriverSerializer.new(object.driver).attributes if object.driver
  end
  def donation_types
    object.donation_types_array
  end
end
