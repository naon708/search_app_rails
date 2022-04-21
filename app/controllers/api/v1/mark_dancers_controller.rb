class Api::V1::MarkDancersController < ApplicationController
  include JwtAuthenticator
  before_action :jwt_authenticate, only: %i[create destroy]

  def create
    dancer = Dancer.find(params[:dancer_id])
    @current_user.marking(dancer)
    render json: { status: 200 }
  end

  def destroy
    dancer = @current_user.mark_dancers.find_by(dancer_id: params[:id]).dancer
    @current_user.unmarking(dancer)
    render json: { status: 204 }
  end
end
