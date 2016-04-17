class Organization < ActiveRecord::Base
  belongs_to :user

  has_one :organization_address
  def address
    orginization_address
  end
end
