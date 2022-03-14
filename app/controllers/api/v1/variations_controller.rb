class Api::V1::VariationsController < ApplicationController
  def index
    @variations = Variation.all.order(:title)
    render json: @variations
  end
end
