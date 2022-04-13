class Api::V1::MarkProgramsController < ApplicationController
  include JwtAuthenticator
  before_action :jwt_authenticate, only: %i[create destroy]

  def create
    program = Program.find(params[:program_id])
    @current_user.marking(program)
    render json: { status: 200 }
  end

  def destroy
    program = @current_user.mark_programs.find_by(program_id: params[:id]).program
    @current_user.unmarking(program)
    render json: { status: 204 }
  end
end
