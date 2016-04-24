class Api::V1::DonationspendingController < ApplicationController
  before_action :authenticate_with_token!
  skip_before_action :verify_authenticity_token

  respond_to :json

  def index
    donations = Donation.where(status_id: 0)
    respond_with donations
  end
end
