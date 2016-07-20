class AddCountryCodeToRecipient < ActiveRecord::Migration
  def change
    add_column :recipients, :country_code, :string, :default => "US"
  end
end
