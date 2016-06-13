class AddStatusIdToDonation < ActiveRecord::Migration
  def change
    add_column :donations, :status_id, :integer
  end
end
