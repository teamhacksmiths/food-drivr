class Donation < ActiveRecord::Base

  before_validation :set_default_values

  belongs_to :donor, :class_name => "Donor", :foreign_key => "donor_id"
  belongs_to :driver, :class_name => "Driver", :foreign_key => "driver_id"
  belongs_to :recipient

  has_one :donation_metum

  belongs_to :status, :class_name => "DonationStatus"
  has_one :pickup
  has_one :dropoff

  has_many :types
  has_many :donation_types, through: :types

  has_many :images, :class_name => "DonationImage"

  def self.most_recent
    Donation.where(status: 0).order(updated_at: :desc)
  end

  def status_name
    self.status.name ? self.status.name : nil
  end

  def donation_types_array
    array = []
    donation_types.each do |type|
      array << type.description
    end
    array
  end

  private

    # Set the default status when a donation is created.
    def set_default_values
      set_default_status
      create_pickup
      create_dropoff
      create_donation_metum
    end

    def set_default_status
      self.status ||= DonationStatus.find(0)
    end

    def create_pickup
      self.pickup = Pickup.create
      self.pickup.status = Pickupstatus.first
    end

    def create_dropoff
      self.dropoff = Dropoff.create
      self.dropoff.status = Dropoffstatus.first
    end

    def create_recipient

    end

    def create_donation_metum
      self.donation_metum = DonationMetum.create
    end
end
