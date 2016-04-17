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

# Dummy recipients
100.times do |n|
  Recipient.create!(name: FFaker::Company.name,
                    street_address: FFaker::AddressUS.street_address,
                    street_address_two: FFaker::AddressUS.secondary_address,
                    city: FFaker::AddressUS.city,
                    zip_code: FFaker::AddressUS.zip_code.split('-')[0].to_i )
end


10.times do |n|
  DonationType.create(description: FFaker::Food.fruit)
end

# Dummy donations
donors = Donor.all
drivers = Driver.all
recipients = Recipient.all
statuses = DonationStatus.all
types = DonationType.all


100.times do |n|
  Donation.create!(donor: donors.sample,
                   driver: drivers.sample,
                   recipient: recipients.sample,
                   description: FFaker::HipsterIpsum.phrase,
                   status: statuses.sample)

end

# Create sample of types for donations
donation = Donation.all

# Loop through and create an array of type_ids
donation_type_ids = []
types.each do |t|
  donation_type_ids << t.id
end

donation.each do |d|
  # make sure that we are creating truly unique types
  local_ids = donation_type_ids
  type_id = local_ids.sample
  Type.create!(donation_id: d.id, donation_type_id: type_id)
  local_ids.delete type_id
  next_type_id = local_ids.sample
  Type.create!(donation_id: d.id, donation_type_id: next_type_id)
end
