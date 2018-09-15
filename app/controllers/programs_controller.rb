class ProgramsController < ApplicationController
  before_action :load_subject, only: :create
  before_action :load, only: [:show, :update, :destroy]

  def index
    render json: Program.all
  end

  def show
    render json: @program
  end

  def create
    program = Program.new(resource_params)
    program.subject = @subject

    if program.save
      render json: program
    else
      render json: { errors: program.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    return render json: { errors: 'Not found' }, status: :not_found unless @program

    if @program.update(resource_params)
      render json: @program
    else
      render json: { errors: @program.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    if @program.destroy
      head :no_content
    else
      render json: { errors: @program.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def resource_params
    params.permit(:day, :done, :class_number)
  end

  def load
    @program = Program.find_by(id: params[:id])
  end

  def load_subject
    @subject = Subject.find_by(id: params[:subject_id])
  end
end
