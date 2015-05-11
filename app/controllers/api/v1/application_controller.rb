class Api::V1::ApplicationController < ApplicationController
  include ActionController::HttpAuthentication::Token::ControllerMethods
  before_filter :restrict_access

  private
    def restrict_access
      authenticate_or_request_with_http_token do |token, options|
        User.find_by(email: options[:email], authentication_token: token)
      end
    end
end