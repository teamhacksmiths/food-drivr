class Api::V1::DonorController < ApplicationController
  before_action :authenticate_with_token!

end
