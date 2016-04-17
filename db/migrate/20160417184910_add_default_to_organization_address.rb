class AddDefaultToOrganizationAddress < ActiveRecord::Migration
  def change
    add_column :organization_addresses, :default, :boolean
  end
end
