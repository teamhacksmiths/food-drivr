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
    after_validation :reverse_geocode, :if => :location_changed?
    # Map the reverse geocoded results back from the geocoder to object.
    reverse_geocoded_by :latitude, :longitude do |obj,results|
      if geo = results.first
        obj.street_address = geo.street_address || geo.address
        obj.city    = geo.city
        obj.state = geo.state
        obj.zip = geo.postal_code
        obj.country_code = geo.country_code
      end
    end
  end

  # Convenience for determing if any address components have changed
  # @return true / false
  def address_changed?
    street_address_changed? || street_address_two_changed? || city_changed? || zip_changed?
  end

  # Determine if the latitude or longitude has changed if any of the fields have changed
    # which will set the reverse geocoder to work.
  # @return true / false
  def location_changed?
    latitude_changed? || longitude_changed?
  end

  # Get the full street address in string format
  # @return Full Street Address string
  #
  # EXAMPLE
  # "123 Main St., Springfield, MA, 02122, US"
  #
  def address
    [street_address, street_address_two, city, state, zip, country_code].compact.join(', ')
  end

  # Get the location in string format joined by a comma
  # @return "Latitude, Longitude" Full Location string, seperated by comma
  #
  # EXAMPLE:
  # "39.33442, 70.33343"
  #
  def location
    [latitude, longitude].compact.join(', ')
  end

  # Convenience for creating a hash from the latitude and longitude
  # Making it easy to set location from a hash
  def location_hash
    hash = {}
    hash[:latitude] = self.latitude if self.latitude
    hash[:longitude] = self.longitude if self.longitude
    hash
  end

  # Convenience for changing the location (lat / long) via an options hash
  # @params Options Hash
  def location=(opts={})
    self.latitude = opts[:latitude]
    self.longitude = opts[:longitude]
  end

  # Convenience for altering address based on hash values.
  # @params Options Hash with full street address components
  # EXAMPLE: { street_address: "123 Main St.", street_address_two: "Apt. 1",
  #            city: "Springfield", state: "MA", zip: "21111", country_code: "US" }
  def address=(opts={})
    self.street_address = opts[:street_address] if opts[:street_address]
    self.street_address_two = opts[:street_address_two] if opts[:street_address_two]
    self.city = opts[:city] if opts[:city]
    self.state = opts[:state] if opts[:state]
    self.zip = opts[:zip] if opts[:zip]
    self.country_code = opts[:country_code] if opts[:country_code]
  end

end
