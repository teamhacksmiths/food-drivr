class AddStateToRecipient < ActiveRecord::Migration
  def change
    add_column :recipients, :state, :string
  end
end
