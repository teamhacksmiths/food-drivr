class Api::V1::DonationsController < Api::ApiController
  respond_to :json

  before_action :authenticate
  def index
    @donations = Donation.all
    respond_with @donations
  end
end
