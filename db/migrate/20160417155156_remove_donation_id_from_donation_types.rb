class RemoveDonationIdFromDonationTypes < ActiveRecord::Migration
  def change
    remove_column :donation_types, :donation_id
  end
end
