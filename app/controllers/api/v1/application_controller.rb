class Api::V1::ApplicationController < ApplicationController
  include ActionController::HttpAuthentication::Token::ControllerMethods
  before_filter :restrict_access

  private
    def restrict_access
      authenticate_or_request_with_http_token do |token, options|
        User.find_by_email_and_authorization_token(options[:email], token)
      end
    end
end