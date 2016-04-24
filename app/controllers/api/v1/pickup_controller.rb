class Api::V1::PickupsController < ApplicationController
  before_action :authenticate_with_token!
  respond_to :json

  def show
    donation = Donation.find(params[:donation_id])
    pickup = donation.pickup
    respond_with pickup
  end

  def create
    donation = current_user.donations.find(params[:donation_id])
    donation.pickup.build(pickup_params)
  end

  def update
    donation = current_user.donations.find(params[:donation_id])
    pickup = donation.pickup
    if pickup.update(pickup_params)
      render json: donation, status: 200, location: [:api_v1, donation]
    else
      render json: { errors: donations.errors }, status: 422
    end
  end

  private
    def pickup_params
      params.require(:pickup).permit(:estimated, :actual,
                                     :latitude, :longitude,
                                     :street_address, :street_address_two,
                                     :city, :state,
                                     :zip, :pickupstatus_id)
    end
end
