class Api::V1::Driver::Donations::DropoffController < ApplicationController
  before_action :authenticate_with_token!
  respond_to :json

  def create
  end
  def update
  end
end
