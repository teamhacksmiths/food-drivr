class Api::V1::Driver::DriverDonationsController < ApplicationController
  before_action :authenticate_with_token!
  respond_to :json

  def index
    @pending_donations = Donation.where(status_id: 0)
    @user_donations = current_user.donations.all
    @accepted_donations = @user_donations.where(status_id: 1)
    @completed_donations = @user_donations.where(status_id: 2)
    @response = { :pending_donations => @pending_donations,
                  :accepted_donations => @accepted_donations,
                  :completed_donations => @completed_donations }
    respond_with @response
  end

  def update
    donation = current_user.donations.find(params[:id])
    if donation.update(donation_params)
      render json: donation, status: 200, location: [:api_v1, donation]
    else
      render json: { errors: donations.errors }, status: 422
    end
  end

  def status
    donation = current_user.donations.find(params[:donation_id])
    status_hash = donation[:status]
    if status_hash[:status_id]
      donation.status = DonationStatus.find(status_hash[:donation_status_id])
    end
    if status_hash[:pickup_status_id]
      donation.pickup.status = Pickupstatus.find(status_hash[:pickup_status_id])
    end
    if status_hash[:dropoff_status_id]
      donation.dropoff.status = Dropoffstatus.find(status_hash[:dropoff_status_id])
    end
  end


  def pending
    donations = Donation.where(status_id: 0)
    render json: donations, status: 200
  end

  def accepted
    donations = current_user.donations.all
    accepted_donations = donations.where(status_id: 1)
    render json: accepted_donations, status: 200
  end

  def completed
    donations = current_user.donations.all
    completed_donations = donations.where(status_id: 2)
    render json: completed_donations, status: 200
  end

  private

    def donation_params
      params.require(:donation).permit(:id, :description, :status_id)
    end

    def status_params
      params.require(:donation).permit(:donation_status,
                                       :pickup_status,
                                       :dropoff_status)
    end
end
