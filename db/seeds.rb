# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

# Define user roles
Role.create!(id: 0, description: 'Donor')
Role.create!(id: 1, description: 'Driver')
Role.create!(id: 2, description: 'Other')

# Run environment-specific seeds
load(Rails.root.join( 'db', 'seeds', "#{Rails.env.downcase}.rb"))