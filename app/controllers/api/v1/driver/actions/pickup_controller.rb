class PickupController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_with_token!, only: [:create, :update]
  def create
    donation = Donation.find(params[:id])
    current_user
  end
  private
    def pickup_params
      params.require(:pickup).permit(:donation_id, :estimated, :actual, :latitude, :longitude)
    end
end
