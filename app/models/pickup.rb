class Pickup < ActiveRecord::Base
  has_one :driver, class_name: "User", :through => :donation
  belongs_to :pickupstatus
  belongs_to :donation
  geocoded_by :address

  after_validation :geocode, :if => :address_changed?

  def status
   pickupstatus
  end

  def address=(opt={})
    self.street_address = opts[:street_address] if opts[:street_address]
    self.street_address_two = opts[:street_address_two] if opts[:street_address_two]
    self.city = opts[:city] if opts[:city]
    self.state = opts[:state] if opts[:state]
    self.zip = opts[:zip] if opts[:zip]
  end

  def address_changed?
    self.street_address_changed? || self.street_address_two_changed? || self.city_changed? || self.zip_changed?
  end

  # Create an alias for status name
  def status_name
    self.status ? self.status.name : nil
  end

  def status=(status)
    self.pickupstatus = status
  end

  def address
    "#{self.street_address} #{self.street_address_two} #{self.city} #{self.state} #{self.zip}"
  end

end
