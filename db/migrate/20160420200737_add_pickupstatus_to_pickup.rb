class AddPickupstatusToPickup < ActiveRecord::Migration
  def change
    add_reference :pickups, :pickupstatus, index: true, foreign_key: true
  end
end
