class CreateDonationMeta < ActiveRecord::Migration
  def change
    create_table :donation_meta do |t|

      t.timestamps null: false
      t.references :donation, :polymorphic => true
    end
  end
end
