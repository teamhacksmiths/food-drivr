class Api::V1::SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    user_password = params[:session][:password]
    user_email = params[:session][:email]
    user = user_email.present? && User.find_by(email: user_email)

    if user.valid_password? user_password
      sign_in user, store: false
      user.generate_authentication_token!
      user.save
      render json: user, serializer: AuthtokenSerializer, status: 200, location: [:api_v1, user]

    else
      render json: { errors: "Invalid email or password" }, status: 422
    end
  end
  def destroy
    user = User.find_by(auth_token: params[:auth_token])
    unless !user
      user.generate_authentication_token!
      user.save
      head 204
    else
      render json: { errors: "Requested resource not found"}, status: 400
    end
  end
end
