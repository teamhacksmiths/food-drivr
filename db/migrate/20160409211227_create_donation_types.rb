class CreateDonationTypes < ActiveRecord::Migration
  def change
    create_table :donation_types do |t|
      t.references :donation, index: true, foreign_key: true
      t.string :description

      t.timestamps null: false
    end
  end
end
