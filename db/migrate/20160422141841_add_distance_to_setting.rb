class AddDistanceToSetting < ActiveRecord::Migration
  def change
    add_column :settings, :distance, :integer, default: 20
  end
end
