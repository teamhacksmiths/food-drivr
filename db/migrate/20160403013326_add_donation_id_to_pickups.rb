class AddDonationIdToPickups < ActiveRecord::Migration
  def change
    add_reference :pickups, :donation, index: true, foreign_key: true
  end
end
