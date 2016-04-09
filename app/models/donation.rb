class Donation < ActiveRecord::Base

  after_initialize :set_default_values

  belongs_to :donor, :class_name => "Donor", :foreign_key => "donor_id"
  belongs_to :driver, :class_name => "Driver", :foreign_key => "driver_id"
  belongs_to :recipient

  has_one :donation_metum

  belongs_to :status, :class_name => "DonationStatus"
  has_one :pickup
  has_one :dropoff

  has_many :donation_types

  private

    # Set the default status when a donation is created.
    def set_default_values
      self.status ||= DonationStatus.find(0)
    end

end
