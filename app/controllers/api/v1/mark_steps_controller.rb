class Api::V1::MarkStepsController < ApplicationController
  include JwtAuthenticator
  before_action :jwt_authenticate, only: %i[create destroy]

  def create
    step = Step.find(params[:step_id])
    @current_user.marking(step)
    render json: { status: 200 }
  end

  def destroy
    step = @current_user.mark_steps.find_by(step_id: params[:id]).step
    @current_user.unmarking(step)
    render json: { status: 204 }
  end
end
