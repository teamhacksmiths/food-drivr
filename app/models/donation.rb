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
  has_many :items, :class_name => "DonationItem", :foreign_key => "donation_id"
  has_many :images, :class_name => "DonationImage"
  accepts_nested_attributes_for :items

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

  # automatically select the closest recipient
  # NOTE: until the site goes live, this may not work due to the fact
  # that our seed data is being generated totally randomly now
  def select_recipient
    if pickup.address != nil || pickup.location != nil
      pickup_location = pickup.address || pickup.location
      closest_recipients = Recipient.all.near(pickup_location)
      if closest_recipients && !self.recipient
        # NOTE: IN PRODUCTION PLEASE REMOVE THE Recipient.all.sample
        self.recipient = closest_recipients.first || Recipient.all.sample
        if self.recipient.location != nil
          recipient_location = self.recipient.location_hash
          self.dropoff.location = recipient_location
        end
      end
    end
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
      unless self.status
        self.status ||= DonationStatus.find(0)
      end
    end

    def create_pickup
      unless self.pickup
        self.pickup = Pickup.create
      end
    end

    def create_dropoff
      unless self.dropoff
        self.dropoff = Dropoff.create
      end
    end

    def create_donation_metum
      unless self.donation_metum
        self.donation_metum = DonationMetum.create
      end
    end
end
