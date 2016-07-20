class AddPrimaryKeyToUser < ActiveRecord::Migration
  def change
    add_column :users, :description, :text
    add_column :users, :expiration, :datetime
    add_column :users, :phone, :string
  end
end
