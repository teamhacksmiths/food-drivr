class Api::V1::Donor::DonorDonationsController < ApplicationController
  before_action :authenticate_with_token!
  respond_to :json

  def index
    respond_with current_user.donations.all
  end
  def create
    current_user.donations.build(donation_params)
  end
  private
    def donation_params
    end
end
