class Api::V1::DancersController < ApplicationController
  def index
    @dancers = Dancer.all.order(:name_order)
    render json: @dancers
  end
end
