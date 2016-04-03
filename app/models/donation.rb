class Donation < ActiveRecord::Base
  before_save :default_status

  belongs_to :donor, :class_name => "User", :foreign_key => "donor_id"
  has_one :driver, :class_name => "User", :foreign_key => "driver_id"
  has_one :recipient, :class_name => "Recipient", :foreign_key => "recipient_id"

  belongs_to :donation_status, :class_name => "DonationStatus", :foreign_key => "status_id"

  def status
    donation_status.name if donation_status
  end

  # Set the default status when a donation is created.
  def default_status
    self.status_id ||= 0
  end

end
