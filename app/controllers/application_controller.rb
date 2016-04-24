class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  include Authenticable
  def index
    render text: "Welcome to the Waste Not Food Taxi API!"
  end
end
