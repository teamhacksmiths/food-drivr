class Organization < ActiveRecord::Base
  belongs_to :user

  has_one :organization_addresses
end
