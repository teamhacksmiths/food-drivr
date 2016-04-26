class Dropoff < ActiveRecord::Base
  has_one :driver, class_name: "User", through: :donation
  belongs_to :dropoffstatus

  def status
   dropoffstatus
  end

  # Create an alias for status name
  def status_name
    self.status ? self.status.name : nil
  end

  def status=(status)
    self.dropoffstatus = status
  end
end
