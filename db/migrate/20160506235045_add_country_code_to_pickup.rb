class AddCountryCodeToPickup < ActiveRecord::Migration
  def change
    add_column :pickups, :country_code, :string, :default => "+1"
  end
end
