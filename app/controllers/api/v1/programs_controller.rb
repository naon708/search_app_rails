class Api::V1::ProgramsController < ApplicationController
  def index
    @programs = Program.all.order(:name_order)
    render json: @programs
  end
end
