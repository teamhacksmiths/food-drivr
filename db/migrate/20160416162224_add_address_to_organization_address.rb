class AddAddressToOrganizationAddress < ActiveRecord::Migration
  def change
    add_column :organization_addresses, :street_address, :string
    add_column :organization_addresses, :street_address_two, :string
    add_column :organization_addresses, :city, :string
    add_column :organization_addresses, :state, :string
    add_column :organization_addresses, :zip, :string
  end
end
