class DonorAddress < ActiveRecord::Base
  after_initialize :set_default_status
  belongs_to :user

  include Addressable

  # Set the address to be default if it is the only one.
  def set_default_status
    count = DonorAddress.where(user_id: self.user_id).count
    if count == nil || count <= 1
      self.default = true
    end
  end
end
