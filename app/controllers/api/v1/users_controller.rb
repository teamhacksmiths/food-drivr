class Api::V1::UsersController < ApplicationController
  before_action :authenticate_with_token!
  skip_before_action :verify_authenticity_token
  
  respond_to :json

  # Show: send JSON data with user found with ID
  def show
    respond_with User.find(params[:id])
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

  # Update will update a user with the params passed in.
  # We need to make sure to safeguard against bad params in the model layer
  def update
    user = current_user
    if user.update(user_params)
      render json: user, status: 200, location: [:api_v1, user]
    else
      render json: { errors: user.errors }, status: 422
    end
  end

  # Delete the current user from the database and send 204
  def destroy
    current_user.destroy
    head 204
  end

  private
    # User params accepted at this point for creating a user are:
      # name, email, password and password_confirmation
    def user_params
      params.require(:user).permit(:email, :role_id, :phone, :organization, :name, :password, :password_confirmation)
    end

end
