class DonationSerializer < ActiveModel::Serializer
  attributes :id, :description, :created_at, :status_id, :updated_at, :participants, :donation_types
  has_one :pickup
  has_one :dropoff
  has_one :recipient

  has_many :images

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
  def status
    # object.donationstatus if object.donation_status
  end
end
