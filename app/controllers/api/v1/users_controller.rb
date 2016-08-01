class Api::V1::UsersController < ApplicationController
  before_action :authenticate_with_token!, only: [:update, :destroy]
  skip_before_action :verify_authenticity_token

  respond_to :json

  # Send the current_user or throw an error
  def show
    current_user = User.find_by(auth_token: params[:auth_token])
    if current_user
      respond_with current_user, serializer: UserSerializer
    else
      render json: { errors: "Invalid request" }, status: 422
    end
  end

  # Create will create a new user with the passed in Params and
    # send a 201 if successful, or a 422 if not.
  def create
    user = User.new(user_params)
    if user.save
      render json: user, status: 201, location: [:api_v1, user]
    else
      render json: { errors: user.errors }, status: 422
    end
  end

  def update_password
    auth_token = params[:auth_token] || request.headers["Authorization"]
    @current_user = User.find_by(auth_token: auth_token)
    if current_user.update_password_with_password(password_params)
      sign_in current_user, :bypass => true
      head 204
    else
      render json: { errors: current_user.erros }, status: 422
    end
  end

  # Update will update a user with the params passed in.
  # if the user has addresses, just totally delete and overwrite them.
  def update
    if current_user && current_user.addresses.length
      current_user.addresses.map(&:destroy)
    end
    if current_user.update(user_params)
      render json: current_user, serializer: UserSerializer, status: 200, location: [:api_v1, current_user]
    else
      render json: { errors: current_user.errors }, status: 422
    end
  end


  private
    # User params accepted at this point for creating a user are:
      # name, email, password and password_confirmation
    def user_params
      params.require(:user).permit(:password, :password_confirmation, :description,
                          :email, :phone, :name, :company, :avatar, :role_id,
                          setting_attributes: [:id, :active, :notifications],
                          addresses_attributes: [:address, :street_address, :street_address_two,
                                                 :city, :state, :zip, :full_address, :default])
    end

    def password_params
      params.require(:user).permit(:current_password, :password, :password_confirmation)
    end
end
