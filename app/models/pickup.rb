class Pickup < ActiveRecord::Base
  has_one :driver, class_name: "User", :through => :donation
  belongs_to :pickupstatus

 # def status
 #   status_name = Pickupstatus.find(pickupstatus_id).name
 #   if status_name
 #     status_name
 #   else
 #     nil
 #   end
 # end
 #  def status=(status)
 #   self.pickupstatus = status
 #  end
end
