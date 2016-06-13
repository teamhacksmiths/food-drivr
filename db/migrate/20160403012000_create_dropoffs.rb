class CreateDropoffs < ActiveRecord::Migration
  def change
    create_table :dropoffs do |t|
      t.datetime :estimated
      t.datetime :actual
      t.decimal  "latitude", :precision => 15, :scale => 10, :default => 0.0
      t.decimal  "longitude", :precision => 15, :scale => 10, :default => 0.0
      t.timestamps null: false
    end
  end
end
