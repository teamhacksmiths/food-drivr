class CreateDonationImages < ActiveRecord::Migration
  def change
    create_table :donation_images do |t|
      t.references :donation, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
