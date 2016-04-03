class AddDefaultValuesToRoles < ActiveRecord::Migration
  def change
    Role.create(description: "Donor", id: 0)
    Role.create(description: "Driver", id: 1)
  end
end
