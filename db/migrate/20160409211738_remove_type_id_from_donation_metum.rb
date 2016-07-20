class RemoveTypeIdFromDonationMetum < ActiveRecord::Migration
  def change
    remove_column :donation_meta, :donation_type
  end
end
