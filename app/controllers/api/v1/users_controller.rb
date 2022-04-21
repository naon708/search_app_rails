class Api::V1::UsersController < ApplicationController
  include JwtAuthenticator
  before_action :jwt_authenticate, only: %i[show]

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
    user_info = {
      name: @current_user.name,
      markedProgramIds: @current_user.mark_programs.pluck(:program_id),
      markedDancerIds: @current_user.mark_dancers.pluck(:dancer_id),
      markedStepIds: @current_user.mark_steps.pluck(:step_id),
      markedVariationIds: @current_user.mark_variations.pluck(:variation_id),
    }
    render json: { user: user_info }
  end

  private

  def user_params
    params.permit(:name, :password, :password_confirmation)
  end
end
