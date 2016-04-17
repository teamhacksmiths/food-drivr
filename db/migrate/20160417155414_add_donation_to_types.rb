class AddDonationToTypes < ActiveRecord::Migration
  def change
    add_reference :types, :donation, index: true, foreign_key: true
  end
end
