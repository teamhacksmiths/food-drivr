class Pickup < ActiveRecord::Base
  has_one :driver, class_name: "User", :through => :donation
  belongs_to :pickupstatus

  def status
   pickupstatus
  end

  # Create an alias for status name
  def status_name
    self.status ? self.status.name : nil
  end

  def status=(status)
    self.pickupstatus = status
  end
end
