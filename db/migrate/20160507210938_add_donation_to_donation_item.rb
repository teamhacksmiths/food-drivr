class AddDonationToDonationItem < ActiveRecord::Migration
  def change
    add_reference :donation_items, :donation, index: true, foreign_key: true
  end
end
