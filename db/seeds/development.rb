dropoffstatuses = Dropoffstatus.all
pickupstatuses = Pickupstatus.all

AdminUser.create!(email: 'admin@example.com',
                  password: 'password',
                  password_confirmation: 'password')


# Dummy donor user
User.create!(name: 'Donor User',
             email: 'donor@hacksmiths.com',
             password: 'password',
             password_confirmation: 'password',
             description: 'An dummy donor user',
             expiration: Time.now + 20.years,
             phone: '+1 123 456 789',
             role_id: 0)


# Dummy driver user
User.create!(name: 'Driver User',
             email: 'driver@hacksmiths.com',
             password: 'password',
             password_confirmation: 'password',
             description: 'An dummy driver user',
             expiration: Time.now + 20.years,
             phone: '+1 123 456 789',
             role_id: 1)

# Dummy other user
User.create!(name: 'Other User',
             email: 'other@hacksmiths.com',
             password: 'password',
             password_confirmation: 'password',
             description: 'An dummy other user',
             expiration: Time.now + 20.years,
             phone: '+1 123 456 789',
             role_id: 2)

# More dummy users
100.times do |n|
  User.create!(name: FFaker::Name.name,
               email: FFaker::Internet.email,
               password: 'password',
               password_confirmation: 'password',
               description: FFaker::Job.title,
               expiration: Time.now + 20.years,
               phone: FFaker::PhoneNumber.phone_number,
               role_id: [*0..2].sample)
end

100.times do |n|
  Organization.create(name: FFaker::Company.name,
                      phone: FFaker::PhoneNumber.phone_number)
end


users = User.all
orgs = Organization.all


orgs.each do |organization|

  organization.organization_addresses << OrganizationAddress.create(organization_id: organization.id,
                                         street_address: FFaker::AddressUS.street_address,
                                         street_address_two: FFaker::AddressUS.secondary_address,
                                         city: FFaker::AddressUS.city,
                                         state: FFaker::AddressUS.state,
                                         zip: FFaker::AddressUS.zip_code.split('-')[0].to_s,
                                         default: true)
  organization.organization_addresses << OrganizationAddress.create(organization_id: organization.id,
                                         street_address: FFaker::AddressUS.street_address,
                                         street_address_two: FFaker::AddressUS.secondary_address,
                                         city: FFaker::AddressUS.city,
                                         state: FFaker::AddressUS.state,
                                         zip: FFaker::AddressUS.zip_code.split('-')[0].to_s,
                                         default: false)
  organization.organization_addresses << OrganizationAddress.create(organization_id: organization.id,
                                         street_address: FFaker::AddressUS.street_address,
                                         street_address_two: FFaker::AddressUS.secondary_address,
                                         city: FFaker::AddressUS.city,
                                         state: FFaker::AddressUS.state,
                                         zip: FFaker::AddressUS.zip_code.split('-')[0].to_s,
                                         default: false)
end

users.each do |u|
  u.organization = orgs.sample
  u.save
end


donors = Donor.all

# Create addresses for the donor
donors.each do |donor|
  donor.addresses << DonorAddress.create(donor_id: donor.id,
                                         street_address: FFaker::AddressUS.street_address,
                                         street_address_two: FFaker::AddressUS.secondary_address,
                                         city: FFaker::AddressUS.city,
                                         state: FFaker::AddressUS.state,
                                         zip: FFaker::AddressUS.zip_code.split('-')[0].to_s,
                                         default: true)

 donor.addresses << DonorAddress.create(donor_id: donor.id,
                                        street_address: FFaker::AddressUS.street_address,
                                        street_address_two: FFaker::AddressUS.secondary_address,
                                        city: FFaker::AddressUS.city,
                                        state: FFaker::AddressUS.state,
                                        zip: FFaker::AddressUS.zip_code.split('-')[0].to_s,
                                        default: false)

donor.addresses << DonorAddress.create(donor_id: donor.id,
                                       street_address: FFaker::AddressUS.street_address,
                                       street_address_two: FFaker::AddressUS.secondary_address,
                                       city: FFaker::AddressUS.city,
                                       state: FFaker::AddressUS.state,
                                       zip: FFaker::AddressUS.zip_code.split('-')[0].to_s,
                                       default: false)
end

# Dummy recipients
20.times do |n|
  Recipient.create!(name: FFaker::Company.name,
                    street_address: FFaker::AddressUS.street_address,
                    street_address_two: FFaker::AddressUS.secondary_address,
                    city: FFaker::AddressUS.city,
                    state: FFaker::AddressUS.state,
                    phone: FFaker::PhoneNumber::phone_number,
                    zip: FFaker::AddressUS.zip_code.split('-')[0].to_s)
end


500.times do |n|
  DonationType.create(description: FFaker::Food.fruit)
end

# Dummy donations
donors = Donor.all
drivers = Driver.all
recipients = Recipient.all
statuses = DonationStatus.last(6)
pending = DonationStatus.first
types = DonationType.all


20.times do |n|
  Donation.create!(donor: donors.sample,
                   driver: drivers.sample,
                   recipient: recipients.sample,
                   note: FFaker::HipsterIpsum.phrase,
                   description: FFaker::HipsterIpsum.phrase,
                   status: statuses.sample)

end

## Create pending donations
20.times do |n|
  Donation.create!(donor: donors.sample,
                   recipient: recipients.sample,
                   note: FFaker::HipsterIpsum.phrase,
                   description: FFaker::HipsterIpsum.phrase,
                   status: pending)
end

# Create sample of types for donations
donations = Donation.all

# Loop through and create an array of type_ids
$donation_type_ids = []
types.each do |t|
  $donation_type_ids << t.id
end

def unique_donation_type_id
  type_id = $donation_type_ids.sample
  $donation_type_ids.delete type_id
  type_id
end

# Loop through the donations, creating all related models
donations.each do |donation|
  # Create 3 unique types for each donation

  DonationItem.create(donation_id: donation.id, description: FFaker::Food::meat,
                      unit: FFaker::UnitEnglish::mass_abbr, quantity: [*1..20].sample)
  DonationItem.create(donation_id: donation.id, description: FFaker::Food::meat,
                      unit: FFaker::UnitEnglish::mass_abbr, quantity: [*1..20].sample)
  DonationItem.create(donation_id: donation.id, description: FFaker::Food::meat,
                      unit: FFaker::UnitEnglish::mass_abbr, quantity: [*1..20].sample)
  DonationItem.create(donation_id: donation.id, description: FFaker::Food::meat,
                      unit: FFaker::UnitEnglish::mass_abbr, quantity: [*1..20].sample)
  DonationItem.create(donation_id: donation.id, description: FFaker::Food::meat,
                      unit: FFaker::UnitEnglish::mass_abbr, quantity: [*1..20].sample)
  DonationItem.create(donation_id: donation.id, description: FFaker::Food::meat,
                      unit: FFaker::UnitEnglish::mass_abbr, quantity: [*1..20].sample)

  Type.create!(donation_id: donation.id, donation_type_id: unique_donation_type_id)
  Type.create!(donation_id: donation.id, donation_type_id: unique_donation_type_id)
  Type.create!(donation_id: donation.id, donation_type_id: unique_donation_type_id)

  donation.pickup = Pickup.create(estimated: FFaker::Time.date,
                           actual: FFaker::Time.date,
                           donation_id: donation.id,
                           latitude: FFaker::Geolocation.lat,
                           longitude: FFaker::Geolocation.lng,
                           street_address: FFaker::AddressUS.street_address,
                           street_address_two: FFaker::AddressUS.secondary_address,
                           city: FFaker::AddressUS.city,
                           state: FFaker::AddressUS.state,
                           zip: FFaker::AddressUS.zip_code.split('-')[0].to_s )

    # Create a dropoff for the donation.
    donation.dropoff = Dropoff.create(estimated: FFaker::Time.date,
                              actual: FFaker::Time.date,
                              donation_id: donation.id,
                              latitude: FFaker::Geolocation.lat,
                              longitude: FFaker::Geolocation.lng,
                              street_address: FFaker::AddressUS.street_address,
                              street_address_two: FFaker::AddressUS.secondary_address,
                              city: FFaker::AddressUS.city,
                              state: FFaker::AddressUS.state,
                              zip: FFaker::AddressUS.zip_code.split('-')[0].to_s )

  # Finally, once all fields are set, save the donation
  donation.save
end
