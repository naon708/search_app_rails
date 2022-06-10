class Api::V1::AutocompletesController < ApplicationController
  def index
    program = Program.all.pluck(:japanese_notation)
    dancer = Dancer.all.pluck(:title)
    step = Step.all.pluck(:japanese_notation)
    variation = Variation.all.pluck(:title)
    
    titles = []
    titles.push(dancer, step).flatten!.sort!
    titles.push(program, variation).flatten!

    render json: { titles: titles }
  end
end
