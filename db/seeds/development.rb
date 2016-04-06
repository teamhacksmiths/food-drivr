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


# Dummy donations
donors = User.where(role_id: 0)
drivers = User.where(role_id: 1)
recipients = Recipient.all
statuses = DonationStatus.all

100.times do |n|
  Donation.create!(donor: donors.sample,
                   driver: drivers.sample,
                   recipient: recipients.sample,
                   status: statuses.sample)
end
