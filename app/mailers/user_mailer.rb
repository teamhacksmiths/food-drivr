class UserMailer < ApplicationMailer
  include Devise::Mailers::Helpers

  default from: "susie@wastenotfoodtaxi.com"
  def confirmation_instructions
    devise_mail(record, :comfirmation_instructions)
  end
  def reset_password_instructions(record)
    devise_mail(record, :reset_password_instructions)
  end
  def unlock_instructions(record)
    devise_mail(record, :unlock_instructions)
  end
end
