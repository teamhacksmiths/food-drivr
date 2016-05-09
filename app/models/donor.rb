class Donor < User
  before_validation :set_default_role!, on: :create

  has_many :donations, foreign_key: "donor_id", class_name: "Donation"
  has_many :addresses, foreign_key: "donor_id", class_name: "DonorAddress"
  accepts_nested_attributes_for :addresses

  # Returns the first of addresses where default is true
  # @params
  # @return Either the first default address or the first address if there is
    # No default address
  def default_address
    default_addresses = self.addresses.where(default: true)
    if default_addresses.count == 0
      self.addresses.first
    else
      default_addresses.first
    end
  end

  private
    # Set the default role to be equal to the type
    def set_default_role!
      begin
        @role = Role.find_by_description self.type
      rescue
        raise "Error setting default role for donor."
      end
    end
end
