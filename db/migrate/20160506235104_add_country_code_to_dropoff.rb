class AddCountryCodeToDropoff < ActiveRecord::Migration
  def change
    add_column :dropoffs, :country_code, :string, :default => "+1"
  end
end
