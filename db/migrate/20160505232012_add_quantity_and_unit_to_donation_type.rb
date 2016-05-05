class AddQuantityAndUnitToDonationType < ActiveRecord::Migration
  def change
    add_column :donation_types, :quantity, :integer
    add_column :donation_types, :unit, :string
  end
end
