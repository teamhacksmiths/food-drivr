class Dropoff < ActiveRecord::Base
  has_one :driver, class_name: "User", through: :donation
  belongs_to :dropoffstatus
  def status
    Dropoffstatus.find(dropoffstatus_id).name
  end
  def status=(status)
    self.dropoffstatus = status
  end
end
