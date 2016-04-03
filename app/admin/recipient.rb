ActiveAdmin.register Recipient do
  permit_params :name, :street_address, :street_address_two, :city, :zip_code, :phone
end
