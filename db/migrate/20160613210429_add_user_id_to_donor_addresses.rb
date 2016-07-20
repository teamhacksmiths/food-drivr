class AddUserIdToDonorAddresses < ActiveRecord::Migration
  def change
    add_column :donor_addresses, :user_id, :integer
  end
end
