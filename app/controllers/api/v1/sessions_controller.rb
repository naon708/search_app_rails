class Api::V1::SessionsController < ApplicationController
  include JwtAuthenticator

  def create
    @user = User.find_by(name: params[:name])
    if @user&.authenticate(params[:password])
      jwt_token = encode(@user.id)
      render json: { token: jwt_token, response: [response.status, response.message, response.headers] }
    else
      render json: { error: 'UnableAuthorizationError', status: 401 }
    end
  end
end
