class UserSerializer < ActiveModel::Serializer
  attributes :id, :phone, :description, :name, :email, :avatar, :role_id, :settings, :address, :organization

  has_one :organization

  def settings
    custom_settings = {}
    unless object.setting == nil
      custom_settings[:notifications] = object.setting.notifications
      custom_settings[:active] = object.setting.active || false
      custom_settings
    end
  end
  def address
    address = object.organization.organization_address
    return_address = {}
    return_address[:street_address] = address.street_address.to_s
    return_address[:street_address_two] = address.street_address_two.to_s
    return_address[:city] = address.city.to_s
    return_address[:state] = address.state.to_s
    return_address[:zip] = address.zip.to_s
    return_address
  end
end
