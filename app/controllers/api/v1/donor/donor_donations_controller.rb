class Api::V1::Donor::DonorDonationsController < ApplicationController
  before_action :authenticate_with_token!
  respond_to :json

  def index
    @user_donations = current_user.donations.all
    render json: {
      donations: ActiveModel::ArraySerializer.new(@user_donations,
                                                  each_serializer: DonationSerializer,
                                                  root: false)
    }
  end

  def show
    respond_with current_user.donations.find(params[:id])
  end

  def create
    @donation = current_user.donations.build(donation_params)
    @donation.save

    @items = params[:donation][:items]
    if @items
      @items.each do |item|
        @donation.items << DonationItem.create(donation_id: @donation.id,
                                               description: item[:description],
                                               unit: item[:unit],
                                               quantity: item[:quantity])
      end
    end

    if params[:donation][:pickup_location] != nil
      @location = params[:donation][:pickup_location]
      @latitude = @location[:latitude].to_f
      @longitude = @location[:longitude].to_f
      location_hash = { :longitude => @longitude, :latitude => @latitude  }
      @donation.pickup.location = location_hash
      @donation.select_recipient
    elsif current_user.default_address != nil
      @donation.pickup.address = current_user.default_address
      @donation.select_recipient
    end
    if @donation.save && @donation.pickup.save
      render json: @donation, status: 201, location: [:api_v1, @donation]
    else
      render json: { errors: @donation.errors }, status: 422
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
      params.require(:donation).permit(:description, :pickup_location, :donation_meta, items_attributes: [:description, :unit, :quantity])
    end

    def item_params
      params.require(:donation).permit(:items => [:description, :unit, :quantity])
    end

end
