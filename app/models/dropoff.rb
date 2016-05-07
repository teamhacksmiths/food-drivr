class Dropoff < ActiveRecord::Base
  has_one :driver, class_name: "User", through: :donation
  belongs_to :dropoffstatus
  belongs_to :donation
  before_validation :set_default_status

  include Geocodable

  # Convenience methods for dealing with status of dropoff
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

  private

    def set_default_status
      if !self.dropoffstatus
        self.dropoffstatus = Dropoffstatus.first
      end
    end
end
