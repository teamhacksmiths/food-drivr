class DonationStatus < ActiveRecord::Base
  has_one :donation
end
