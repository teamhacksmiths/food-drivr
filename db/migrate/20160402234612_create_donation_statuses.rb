class CreateDonationStatuses < ActiveRecord::Migration
  def change
    create_table :donation_statuses do |t|
      t.string :name
    end
  end
end
