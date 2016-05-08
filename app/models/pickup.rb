class Pickup < ActiveRecord::Base
  has_one :driver, class_name: "User", :through => :donation
  belongs_to :pickupstatus
  belongs_to :donation
  before_validation :set_default_status

  include Geocodable

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

  private
    # Set status to pending on creation
    def set_default_status
      if !self.pickupstatus
        self.pickupstatus = Pickupstatus.first
      end
    end
end
