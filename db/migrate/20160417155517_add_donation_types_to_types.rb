class AddDonationTypesToTypes < ActiveRecord::Migration
  def change
    add_reference :types, :donation_type, index: true, foreign_key: true
  end
end
