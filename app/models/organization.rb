class Organization < ActiveRecord::Base
  belongs_to :user

  has_many :organization_addresses
  def default_address
    # Select the first default address or select the first address if no defaults
    # Exist
    default = organization_addresses.select{ |p| p.default == true }.first
    if default
      default
    elsif organization_addresses
      organization_addresses.first
    else
      nil
    end
  end

  def return_address
    if default_address
      return_address = {}
      return_address[:street_address] = default_address.street_address.to_s
      return_address[:street_address_two] = default_address.street_address_two.to_s
      return_address[:city] = default_address.city.to_s
      return_address[:state] = default_address.state.to_s
      return_address[:zip] = default_address.zip.to_s
      return_address
    end
  end
end
