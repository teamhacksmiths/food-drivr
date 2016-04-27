class Dropoff < ActiveRecord::Base
  has_one :driver, class_name: "User", through: :donation
  belongs_to :dropoffstatus

  geocoded_by :address

  after_validation :geocode, :if => :address_changed?

  def status
   dropoffstatus
  end

  # Create an alias for status name
  def status_name
    self.status ? self.status.name : nil
  end

  def address_changed?
    self.street_address_changed? || self.street_address_two_changed? || self.city_changed? || self.zip_changed?
  end

  def address
    addr_array = [self.street_address, self.street_address_two, self.city, self.state, self.zip]
    address = addr_array.join(', ')
    address
  end

  def status=(status)
    self.dropoffstatus = status
  end
end
