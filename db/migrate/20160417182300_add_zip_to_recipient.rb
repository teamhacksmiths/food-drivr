class AddZipToRecipient < ActiveRecord::Migration
  def change
    remove_column :recipients, :zip_code
    add_column :recipients, :zip, :string
  end
end
