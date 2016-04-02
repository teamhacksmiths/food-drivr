class AddRecipientIdToDonation < ActiveRecord::Migration
  def change
    add_column :donations, :recipient_id, :integer
  end
end
