class CreateOrganizationAddresses < ActiveRecord::Migration
  def change
    create_table :organization_addresses do |t|
      t.references :organization, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
