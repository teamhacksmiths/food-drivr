class AddAddressToDropoff < ActiveRecord::Migration
  def change
    add_column :dropoffs, :street_address, :string
    add_column :dropoffs, :street_address_two, :string
    add_column :dropoffs, :city, :string
    add_column :dropoffs, :state, :string
    add_column :dropoffs, :zip, :string
  end
end
