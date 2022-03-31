class Api::V1::UsersController < ApplicationController
  include JwtAuthenticator

  def create
    user = User.new(user_params)
    if user.save
      user = { name: user.name }
      render json: { user: user, status: 200 }
    else
      render json: { error: user.errors, status: 401 }
    end
  end

  def show
    jwt_authenticate
    user_info = { name: @current_user.name }
    render json: { user: user_info }
  end

  private

  def user_params
    params.permit(:name, :password, :password_confirmation)
  end
end
