class DonorController < ApplicationController
  before_action :authenticate_with_token!
  skip_before_action :verify_authenticity_token
  
  def method
    #code
  end
end
