class Api::V1::InAppSearchesController < ApplicationController
  def index
    programs = Program.search(params[:q])
    dancers = Dancer.search(params[:q])
    steps = Step.search(params[:q])
    variations = Variation.search(params[:q])
    variations_from_program_name = VariationProgram.search(params[:q])

    variations = (variations.to_a + variations_from_program_name.to_a).uniq
    render json: { programs: programs, dancers: dancers, steps: steps, variations: variations }
  end
end
