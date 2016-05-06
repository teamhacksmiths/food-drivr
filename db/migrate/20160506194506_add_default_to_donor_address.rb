class AddDefaultToDonorAddress < ActiveRecord::Migration
  def change
    add_column :donor_addresses, :default, :boolean, :default => false
  end
end
