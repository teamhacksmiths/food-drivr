ActiveAdmin.register Role do
  menu parent: "Configurations"
  config.batch_actions = false

  permit_params :description
end
