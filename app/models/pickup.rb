class Pickup < ActiveRecord::Base
  has_one :driver, class_name: "User", :through => :donation
  belongs_to :pickupstatus
  belongs_to :donation
  geocoded_by :address
  # Map the reverse geocoded results back from the geocoder to object.
  reverse_geocoded_by :latitude, :longitude do |obj,results|
    if geo = results.first
      obj.street_address = geo.address
      obj.city    = geo.city
      obj.zip = geo.postal_code
      obj.country_code = geo.country_code
    end
  end
  after_validation :reverse_geocode, :if => :location_changed?

  after_validation :geocode, :if => :address_changed?
  before_validation :set_default_status

  # Convenience for changing the location (lat / long) via an options hash
  def location=(opts={})
    self.latitude = opts[:latitude]
    self.longitude = opts[:longitude]
  end

  # Convenience for updation address based on hash values.
  def address=(address)

    self.street_address = opts[:street_address] if opts[:street_address]
    self.street_address_two = opts[:street_address_two] if opts[:street_address_two]
    self.city = opts[:city] if opts[:city]
    self.state = opts[:state] if opts[:state]
    self.zip = opts[:zip] if opts[:zip]
  end

  # Alias for getting the status of a pickup
  def status
   pickupstatus
  end

  # Create an alias for status name
  def status_name
    self.pickupstatus ? self.pickupstatus.name : nil
  end

  # Convenience for setting pickup status
  def status=(status)
    self.pickupstatus = status
  end

  # @return Full Address Stringified
  def address
    "#{self.street_address} #{self.street_address_two} #{self.city} #{self.state} #{self.zip}"
  end

  private
    # Set status to pending on creation
    def set_default_status
      if !self.pickupstatus
        self.pickupstatus = Pickupstatus.first
      end
    end

    # Determine if the latitude or longitude has changed if any of the fields have changed
      # which will set the reverse geocoder to work.
    def location_changed?
      self.latitude_changed? || self.longitude_changed?
    end

    # Determine if the address has changed if any of the fields have changed
      # which will set the geocoder to work.
    def address_changed?
      self.street_address_changed? || self.street_address_two_changed? || self.city_changed? || self.zip_changed?
    end

end
