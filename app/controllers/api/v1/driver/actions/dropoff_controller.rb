class DropoffController < ApplicationController
  before_action :authenticate_with_token!, only: [:create, :update]
  def create
    donation = Donation.find(params[:id])
  end

  def update
  end

  def destroy
  end
  private
    def pickup_params
      params.require(:pickup).permit(:donation_id, :estimated, :actual, :latitude, :longitude)
    end
end
