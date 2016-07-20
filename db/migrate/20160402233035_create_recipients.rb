class CreateRecipients < ActiveRecord::Migration
  def change
    create_table :recipients do |t|
      t.string :name
      t.string :street_address
      t.string :street_address_two
      t.string :city
      t.integer :zip_code
      t.integer :phone

      t.timestamps null: false
    end
  end
end
