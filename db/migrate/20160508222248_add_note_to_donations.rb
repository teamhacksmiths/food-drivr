class AddNoteToDonations < ActiveRecord::Migration
  def change
    add_column :donations, :note, :string
  end
end
