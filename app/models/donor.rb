class Donor < User
  before_validation :set_default_role!, on: :create

  has_many :donations, foreign_key: "donor_id", class_name: "Donation"

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
