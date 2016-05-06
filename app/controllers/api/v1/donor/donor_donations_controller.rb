class Api::V1::Donor::DonorDonationsController < ApplicationController
  before_action :authenticate_with_token!
  respond_to :json

  def index
    respond_with current_user.donations.all
  end

  def show
    respond_with current_user.donations.find(params[:id])
  end

  def create
    donation = current_user.donations.build(donation_params)
    if donation.save
      render json: donation, status: 201, location: [:api_v1, donation]
    else
      render json: { errors: donation.errors }, status: 422
    end
  end

  def update
    donation = current_user.donations.find(params[:id])
    if donation.update(donation_params)
      render json: donation, status: 200, location: [:api_v1, donation]
    else
      render json: { errors: donation.errors }, status: 422
    end
  end

  private

    def donation_params
      params.require(:donation).permit(:description, :donation_types, :donation_meta)
    end

end
