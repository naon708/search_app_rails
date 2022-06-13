class Api::V1::AutocompletesController < ApplicationController
  def index
    program = Program.pluck(:japanese_notation)
    dancer = Dancer.pluck(:title)
    step = Step.pluck(:japanese_notation)
    variation = Variation.pluck(:title)
    
    titles = []
    titles.push(dancer, step).flatten!.sort!
    titles.push(program, variation).flatten!

    render json: { titles: titles }
  end
end
