class ExamsController < ApplicationController
  before_action :load_lesson, only: :create
  before_action :load, only: [:show, :update, :destroy]
  before_action :load_list, only: :index

  def index
    render json: @exams
  end

  def show
    render json: @exam, serializer: ::ExamSerializer
  end

  def create
    exam = Exam.new(resource_params)
    exam.lesson = @lesson

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
    params.permit(:title, :lesson_id, :enabled)
  end

  def load
    @exam = Exam.find_by(id: params[:id])
  end

  def load_list
    @exams = Exam.where(lesson_id: params[:lesson_id]) if params[:lesson_id]
    @exams ||= Exam.all
  end
end
