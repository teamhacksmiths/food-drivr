class ChangeUserIdInDonorAddresses < ActiveRecord::Migration
  def change
    remove_column :donor_addresses, :user_id
    add_column :donor_addresses, :user_id, :integer
  end
end
