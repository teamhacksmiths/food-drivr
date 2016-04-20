class AddDropoffstatusToDropoff < ActiveRecord::Migration
  def change
    add_reference :dropoffs, :dropoffstatus, index: true, foreign_key: true
  end
end
