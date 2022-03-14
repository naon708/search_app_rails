class Api::V1::StepsController < ApplicationController
  def index
    @steps = Step.all.order(:japanese_notation)
    render json: @steps
  end
end
