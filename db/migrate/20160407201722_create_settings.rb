class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.boolean :notifications
      t.boolean :active

      t.timestamps null: false
    end
  end
end
