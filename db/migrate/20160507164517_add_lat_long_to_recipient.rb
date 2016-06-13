class AddLatLongToRecipient < ActiveRecord::Migration
  def change
    add_column :recipients, :latitude, :decimal, precision: 15, scale: 10, default: 0.0
    add_column :recipients, :longitude, :decimal, precision: 15, scale: 10, default: 0.0
  end
end
