class AddDriverIdToDonation < ActiveRecord::Migration
  def change
    add_column :donations, :driver_id, :integer
  end
end
