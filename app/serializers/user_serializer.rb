class UserSerializer < ActiveModel::Serializer
  attributes :id, :phone, :description, :name, :email, :avatar, :role_id, :settings, :default_address

  has_one :organization

  def settings
    custom_settings = {}
    unless object.setting == nil
      custom_settings[:notifications] = object.setting.notifications
      custom_settings[:active] = object.setting.active || false
      custom_settings
    end
  end
  def default_address
    if object.organization && object.organization.return_address
      object.organization.return_address
    end
  end
end
