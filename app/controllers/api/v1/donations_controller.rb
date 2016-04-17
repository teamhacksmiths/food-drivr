class Api::V1::DonationsController < ApplicationController
  before_action :authenticate_with_token!
  skip_before_action :verify_authenticity_token

  respond_to :json

  def show
    respond_with Donation.find(params[:id])
  end

  def index
    respond_with Donation.all
  end

  # For creating a new donation:
  def create
    donation = current_user.donations.build(donation_params)
    if donation.save
      render json: donation, status: 201, location: [:api_v1, donation]
    else
      render json: { errors: donations.errors }, status: 422
    end
  end

  def update
    donation = current_user.donations.find(params[:id])
    if donations.update(donation_params)
      render json: donation, status: 200, location: [:api_v1, donation]
    else
      render json: { errors: product.errors }, status: 422
    end
  end

  def destroy
    donation = current_user.donations.find(params[:id])
    donation.destroy
    head 204
  end

  private

  def donation_params
    params.require(:donation).permit(:recipient, :status_id, :description) #TODO: add params for donations
  end

  # TODO: add a better mechanism for how the recipient is created.
  def recipient_params
    params.require(:recipient).permit(:id, :name,
                                      :estimated, :actual,
                                      :latitude, :longitude,
                                      :street_address, :street_address_two,
                                      :donation_id, :city, :state, :zip)
  end
  def pickup_params
    params.require(:pickup).permit(:driver_id)
  end
  def dropoff_params
    params.require(:dropoff).permit(:driver_id)
  end
end
