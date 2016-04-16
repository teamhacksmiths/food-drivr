class UserSerializer < ActiveModel::Serializer
  attributes :id, :phone, :expiration, :description, :name, :email, :avatar, :role_id, :settings

  def settings
    custom_settings = {}
    custom_settings[:notifications] = object.setting.notifications
    custom_settings[:active] = object.setting.active
  end
end
