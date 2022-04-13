class Api::V1::MarkProgramsController < ApplicationController
  include JwtAuthenticator
  before_action :jwt_authenticate, only: %i[create destroy]

  def create
    program = Program.find(params[:program_id])
    if @current_user.marking(program)
      render json: @current_user.mark_programs
    end
  end

  def destroy
    program = @current_user.mark_programs.find_by(program_id: params[:id]).program
    if @current_user.unmarking(program)
      render json: { errors: '削除しました', status: 204 }
    else
      render json: { errors: '失敗', status: 404 }
    end
  end
end
