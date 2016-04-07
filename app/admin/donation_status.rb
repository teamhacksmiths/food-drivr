ActiveAdmin.register DonationStatus do
  menu parent: "Configurations"
  config.batch_actions = false

  permit_params :name
end
