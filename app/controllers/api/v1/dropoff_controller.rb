class Api::V1::DropoffsController < ApplicationController
  before_action :authenticate_with_token!
  respond_to :json

  def show
    donation = Donation.find(params[:donation_id])
    dropoff = donation.dropoff
    respond_with dropoff
  end

  def create
    donation = current_user.donations.find(params[:donation_id])
    donation.dropoff.build(dropoff_params)
  end

  def update
    donation = current_user.donations.find(params[:donation_id])
    dropoff = donation.dropoff
    if dropoff.update(dropoff_params)
      render json: donation, status: 200, location: [:api_v1, donation]
    else
      render json: { errors: donations.errors }, status: 422
    end
  end

  private

    def dropoff_params
      params.require(:dropoff).permit(:estimated, :actual,
                                      :latitude, :longitude,
                                      :street_address, :street_address_two,
                                      :city, :state,
                                      :zip, :dropoffstatus_id)
    end
end
