class DonorAddress < ActiveRecord::Base
  after_initialize :set_default_status
  belongs_to :donor

  # Set the address to be default if it is the only one.
  def set_default_status
    count = DonorAddress.where(donor_id: self.donor_id).count
    if count == nil || count <= 1
      puts("Count is less than or equal to 1")
      self.default = true
    end
  end
end
