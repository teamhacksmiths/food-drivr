class CreatePickupstatuses < ActiveRecord::Migration
  def change
    create_table :pickupstatuses do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
