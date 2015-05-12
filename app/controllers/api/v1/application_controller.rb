class Api::V1::ApplicationController < ApplicationController
  include ActionController::HttpAuthentication::Token::ControllerMethods
  before_filter :restrict_access
  around_filter :check_user

  private

    def check_user
      if current_user
        yield
      else
        render json: {}, status: :unauthorized
      end
    end

    def restrict_access
      authenticate_or_request_with_http_token do |token, options|
        User.find_by(email: options[:email], authentication_token: token)
      end
    end

    def current_user
      restrict_access
    end
end