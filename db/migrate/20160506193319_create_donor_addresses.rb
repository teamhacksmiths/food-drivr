class CreateDonorAddresses < ActiveRecord::Migration
  def change
    create_table :donor_addresses do |t|
      t.string :street_address
      t.string :street_address_two
      t.string :city
      t.string :state
      t.string :zip

      t.timestamps null: false
    end
  end
end
