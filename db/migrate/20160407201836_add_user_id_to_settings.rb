class AddUserIdToSettings < ActiveRecord::Migration
  def change
    add_reference :settings, :user, index: true, foreign_key: true
  end
end
