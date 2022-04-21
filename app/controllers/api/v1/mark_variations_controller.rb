class Api::V1::MarkVariationsController < ApplicationController
  include JwtAuthenticator
  before_action :jwt_authenticate, only: %i[create destroy]

  def create
    variation = Variation.find(params[:variation_id])
    @current_user.marking(variation)
    render json: { status: 200 }
  end

  def destroy
    variation = @current_user.mark_variations.find_by(variation_id: params[:id]).variation
    @current_user.unmarking(variation)
    render json: { status: 204 }
  end
end
