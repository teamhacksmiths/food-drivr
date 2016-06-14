require 'street_address'
class DonorAddress < ActiveRecord::Base
  after_initialize :set_default_status
  belongs_to :user

  def full_address=(address)
    new_address = StreetAddress::US.parse(address)
    self.full_address = address
    self.street_address = "#{new_address.number} #{new_address.street} #{new_address.street_type}"
    street_address_two = "#{new_address.unit}"
    self.city = new_address.city
    self.state = new_address.state
    self.zip = new_address.postal_code
  end

  # Set the address to be default if it is the only one.
  def set_default_status
    count = DonorAddress.where(user_id: self.user_id).count
    if count == nil || count <= 1
      puts("Count is less than or equal to 1")
      self.default = true
    end
  end
end
