class CreateDonationItems < ActiveRecord::Migration
  def change
    create_table :donation_items do |t|
      t.string :description
      t.integer :quanity
      t.string :unit

      t.timestamps null: false
    end
  end
end
