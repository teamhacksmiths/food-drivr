class Donation < ActiveRecord::Base
  before_save :default_status

  belongs_to :donor, :class_name => "User", :foreign_key => "donor_id"
  belongs_to :driver, :class_name => "User", :foreign_key => "driver_id"
  belongs_to :recipient

  has_one :donation_metum

  belongs_to :donation_status

  def status
    donation_status.name if donation_status
  end

  private
  # Set the default status when a donation is created.
  def default_status
    self.status = DonationStatus.find(0)
  end

end
