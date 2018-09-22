class ExamsController < ApplicationController
  before_action :load_subject, only: :create
  before_action :load, only: [:show, :update, :destroy]

  def index
    render json: Exam.all
  end

  def show
    render json: @exam
  end

  def create
    exam = Exam.new(resource_params)
    exam.subject = @subject

    if exam.save
      render json: exam
    else
      render json: { errors: exam.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    return render json: { errors: 'Not found' }, status: :not_found unless @exam

    if @exam.update(resource_params)
      render json: @exam
    else
      render json: { errors: @exam.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    if @exam.destroy
      head :no_content
    else
      render json: { errors: @exam.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def resource_params
    params.permit(:title)
  end

  def load
    @exam = Exam.find_by(id: params[:id])
  end

  def load_subject
    @subject = Subject.find_by(id: params[:subject_id])
  end
end