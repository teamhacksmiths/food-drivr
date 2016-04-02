class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|

      t.timestamps null: false
    end
  end
end
