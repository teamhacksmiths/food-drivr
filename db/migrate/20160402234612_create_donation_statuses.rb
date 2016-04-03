class CreateDonationStatuses < ActiveRecord::Migration
  def change
    create_table :donation_statuses do |t|
      t.string :name
    end
    DonationStatus.create(name: 'Pending', id: 0)
    DonationStatus.create(name: 'Active', id: 1)
    DonationStatus.create(name: 'Completed', id: 2)
    DonationStatus.create(name: 'Suspended', id: 3)
  end
end
