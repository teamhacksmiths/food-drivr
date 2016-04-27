class Api::V1::Driver::DriverController < ApplicationController
  before_action :authenticate_with_token!
  skip_before_action :verify_authenticity_token

  def check_status
    @driver = current_user
    render json: {
      active: @driver.setting.active
    }
  end
end
