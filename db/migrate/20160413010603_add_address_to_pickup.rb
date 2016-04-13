class AddAddressToPickup < ActiveRecord::Migration
  def change
    add_column :pickups, :street_address, :string
    add_column :pickups, :street_address_two, :string
    add_column :pickups, :city, :string
    add_column :pickups, :state, :string
    add_column :pickups, :zip, :string
  end
end
