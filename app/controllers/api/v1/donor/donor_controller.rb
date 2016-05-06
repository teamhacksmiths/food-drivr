class Api::V1::DonorController < ApplicationController
  before_action :authenticate_with_token!
  
  def show
    current_donor = Donor.find_by(auth_token: params[:auth_token])
    if current_donor
      respond_with current_donor, serializer: DonorSerializer
    else
      render json: { errors: "Invalid request" }, status: 422
    end
  end

  # Update will update a user with the params passed in.
  # We need to make sure to safeguard against bad params in the model layer
  def update
    unless current_user.type == "Donor"
      render json: { errors: "Current user is not a donor.", status: 422 }
    end
    if current_user.update(donor_params)
      render json: current_user, serializer: DonorSerializer, status: 200, location: [:api_v1, current_user]
    else
      render json: { errors: user.errors }, status: 422
    end
  end

  private
    # User params accepted at this point for creating a user are:
      # name, email, password and password_confirmation
    def donor_params
      params.require(:user).permit(:password, :password_confirmation, :description,
                          :email, :phone, :name, :avatar,
                          setting_attributes: [:id, :active, :notifications],
                          :addresses)
    end
end
