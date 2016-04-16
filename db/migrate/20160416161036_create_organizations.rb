class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|

      t.timestamps null: false
    end
  end
end
