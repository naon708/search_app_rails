class Api::V1::VariationProgramsController < ApplicationController
  def index
    @variation_programs = VariationProgram.all
    render json: @variation_programs
  end
end
