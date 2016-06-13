class RemoveDonorIdFromDonorAddresses < ActiveRecord::Migration
  def change
    remove_column :donor_addresses, :donor_id
  end
end
