class Pickup < ActiveRecord::Base
  has_one :driver, class_name: "User", :through => :donation
  belongs_to :pickupstatus

  def status
    Pickupstatus.find(pickupstatus_id).name
  end
  def status=(status)
    self.pickupstatus = status
  end
end
