class Dropoff < ActiveRecord::Base
  has_one :driver, class_name: "User", through: :donation
  belongs_to :dropoffstatus
  belongs_to :donation
  before_validation :set_default_status

  geocoded_by :address
  after_validation :geocode, :if => :address_changed?

  # Map the reverse geocoded results back from the geocoder to object.
  reverse_geocoded_by :latitude, :longitude do |obj,results|
    if geo = results.first
      obj.street_address = geo.street_address
      obj.city    = geo.city
      obj.state = geo.state
      obj.zip = geo.postal_code
      obj.country_code = geo.country_code
    end
  end
  after_validation :reverse_geocode, :if => :location_changed?

  # Convenience for updation address based on hash values.
  def address=(opts={})
    self.street_address = opts[:street_address] if opts[:street_address]
    self.street_address_two = opts[:street_address_two] if opts[:street_address_two]
    self.city = opts[:city] if opts[:city]
    self.state = opts[:state] if opts[:state]
    self.zip = opts[:zip] if opts[:zip]
    self.country_code = opts[:country_code] if opts[:country_code]
  end

  # Convenience for changing the location (lat / long) via an options hash
  def location=(opts={})
    self.latitude = opts[:latitude]
    self.longitude = opts[:longitude]
  end

  # @return Full Address Stringified
  def address
    addr_array = [self.street_address, self.street_address_two, self.city, self.state, self.zip]
    address = addr_array.join(', ')
    address
  end

  # Convenience methods for dealing with status of dropoff
  def status
   dropoffstatus
  end

  # Create an alias for status name
  def status_name
    self.status ? self.status.name : nil
  end

  def status=(status)
    self.dropoffstatus = status
  end

  private

    def address_changed?
      self.street_address_changed? || self.street_address_two_changed? || self.city_changed? || self.zip_changed?
    end

    # Determine if the latitude or longitude has changed if any of the fields have changed
      # which will set the reverse geocoder to work.
    def location_changed?
      self.latitude_changed? || self.longitude_changed?
    end

    def set_default_status
      if !self.dropoffstatus
        self.dropoffstatus = Dropoffstatus.first
      end
    end
end
