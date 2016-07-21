require 'active_support/concern'
require 'street_address'
# Creates a module for parsing street addresses from an address string.
#
module Addressable
  extend ActiveSupport::Concern

  included do
    # Set parameters for geocoding and add the hook to geocode / reverse geocode
    geocoded_by :full_address do |obj, results|
      if geo = results.first
        obj.street_address = geo.street_address
        obj.city    = geo.city
        obj.state = geo.state
        obj.zip = geo.postal_code
      end
    end
    after_validation :geocode, :if => :address_changed?
  end

  # Convenience for determing if any address components have changed
  # @return true / false
  def address_changed?
    full_address_changed? || street_address_changed? || street_address_two_changed? || city_changed? || zip_changed?
  end

  def construct_address(address)
    constructed_address = ""
    constructed_address += address.number if address.number
    constructed_address += address.street if address.street
    constructed_address += address.street_type if address.street_type
    constructed_address
  end

  # Convenience for altering address based on hash values.
  # @params Options Hash with full street address components
  # EXAMPLE: { street_address: "123 Main St.", street_address_two: "Apt. 1",
  #            city: "Springfield", state: "MA", zip: "21111", country_code: "US" }
  def full_address=(address)
    new_address = StreetAddress::US.parse(address)
    self.street_address = construct_address(address)
    self.city = new_address.city
    self.state = new_address.state
    self.zip = new_address.postal_code
  end
end
