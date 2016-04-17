class Organization < ActiveRecord::Base
  belongs_to :user

  has_one :organization_address

  def address
    organization_address
  end

end
