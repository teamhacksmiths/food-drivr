class Organization < ActiveRecord::Base
  belongs_to :user

  has_many :organization_addresses
  def address
    organization_address
  end
end
