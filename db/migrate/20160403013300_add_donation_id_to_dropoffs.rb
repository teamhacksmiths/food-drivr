class AddDonationIdToDropoffs < ActiveRecord::Migration
  def change
    add_reference :dropoffs, :donation, index: true, foreign_key: true
  end
end
