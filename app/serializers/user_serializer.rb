class UserSerializer < ActiveModel::Serializer
  attributes :id, :phone, :name, :company, :email, :avatar, :role_id, :type, :settings, :addresses

  def settings
    custom_settings = {}
    unless object.setting == nil
      custom_settings[:notifications] = object.setting.notifications
      custom_settings[:active] = object.setting.active || false
      custom_settings
    end
  end
end
