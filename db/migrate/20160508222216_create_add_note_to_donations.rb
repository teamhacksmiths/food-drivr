class CreateAddNoteToDonations < ActiveRecord::Migration
  def change
    create_table :add_note_to_donations do |t|
      t.string :note

      t.timestamps null: false
    end
  end
end
