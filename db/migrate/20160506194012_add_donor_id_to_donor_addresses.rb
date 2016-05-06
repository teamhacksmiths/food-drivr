class AddDonorIdToDonorAddresses < ActiveRecord::Migration
  def change
    add_reference :donor_addresses, :donor, index: true
  end
end
