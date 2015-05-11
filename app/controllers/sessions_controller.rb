class SessionsController < ApplicationController
  def create
    ap params
    user = User.authenticate(params[:user][:email], params[:user][:password])
    data = {
      token: user.authentication_token,
      email: user.email
    }
    render json: data, status: 201 and return
  end
end
