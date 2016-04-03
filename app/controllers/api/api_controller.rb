class BaseApiController < ApplicationController
  before_filter :parse_request, :authenticate_user_with_token!

  private
    def authenticate_user_with_token!
      if !@json['auth_token']
        render nothing:  true, status: :unauthorized
      else
        @user = nil
        User.find_each do |u|
          if Devise.secure_compare(u.auth_token), @json['auth_token']
            @user = u
          end
        end
      end
    end

    def parse_request
      @json = JSON.parse(request.body.read)
    end
end
