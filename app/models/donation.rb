class Donation < ActiveRecord::Base
  attr_accessible :driver_id, :donor_id, :recipient_id
  belongs_to :donor, :class_name => "User", :foreign_key => "donor_id"
  has_one :driver, :class_name => "User", :foreign_key => "driver_id"
  has_one :recipient :class_name => "Recipient", :foreign_key => "recipient_id"
end
