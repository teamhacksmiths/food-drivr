require 'active_support/concern'
# Creates a module for geocoding concerns for all models
# Adds models for checking for address changes, location changes that
# automatically geocode.
#
# EXAMPLE:
# Set a location hash with longitude and latitude and the address will
# Reverse geocode to include the full address with all components.
# model.location = {latitude: -39.34433, longitude: 70.30403 }
#
# Alternatively, setting the various address components,
# i.e.
#      street_address = "123 Main St"
#      city = "Main City"
#      state = "MA"
# or
#      address = {street_address: "123 Main St.", city: "Springfield", state: "MA" }
#
# Will geocode the address, setting the location to match the geocoordinates.
# Pretty nifty and useful little module if I don't say so myself.
#
# module Geocodable
module Geocodable
  extend ActiveSupport::Concern

  included do
    # Set parameters for geocoding and add the hook to geocode / reverse geocode
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
  end

  def address_changed?
    street_address_changed? || street_address_two_changed? || city_changed? || zip_changed?
  end

  # Determine if the latitude or longitude has changed if any of the fields have changed
    # which will set the reverse geocoder to work.
  def location_changed?
    latitude_changed? || longitude_changed?
  end

  def address
    [street_address, street_address_two, city, state, zip, country_code].compact.join(', ')
  end

  def location
    [latitude, longitude].compact.join(', ')
  end

  # Convenience for changing the location (lat / long) via an options hash
  def location=(opts={})
    self.latitude = opts[:latitude]
    self.longitude = opts[:longitude]
  end

  # Convenience for updation address based on hash values.
  def address=(opts={})
    self.street_address = opts[:street_address] if opts[:street_address]
    self.street_address_two = opts[:street_address_two] if opts[:street_address_two]
    self.city = opts[:city] if opts[:city]
    self.state = opts[:state] if opts[:state]
    self.zip = opts[:zip] if opts[:zip]
  end

end
