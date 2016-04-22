# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

# Define user roles
Role.create!(id: 0, description: 'Donor')
Role.create!(id: 1, description: 'Driver')
Role.create!(id: 2, description: 'Other')
Role.create!(id: 3, description: 'Unassigned')

# Define donatan status
DonationStatus.create!(name: 'Pending', id: 0)
DonationStatus.create!(name: 'Accepted', id: 1)
DonationStatus.create!(name: 'Completed', id: 2)
DonationStatus.create!(name: 'Suspended', id: 3)
DonationStatus.create!(name: 'Cancelled', id: 4)

Pickupstatus.create!(name: 'Pending', id: 0)
Pickupstatus.create!(name: 'Accepted', id: 1)
Pickupstatus.create!(name: 'Completed', id: 2)
Pickupstatus.create!(name: 'Suspended', id: 3)
Pickupstatus.create!(name: 'Cancelled', id: 4)

Dropoffstatus.create!(name: 'Pending', id: 0)
Dropoffstatus.create!(name: 'Accepted', id: 1)
Dropoffstatus.create!(name: 'Completed', id: 2)
Dropoffstatus.create!(name: 'Suspended', id: 3)
Dropoffstatus.create!(name: 'Cancelled', id: 4)

# Run environment-specific seeds
load(Rails.root.join( 'db', 'seeds', "#{Rails.env.downcase}.rb"))
