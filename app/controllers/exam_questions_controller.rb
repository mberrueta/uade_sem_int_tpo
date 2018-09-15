class ExamQuestionsController < ApplicationController
  before_action :load_exam, only: :create
  before_action :load, only: [:show, :update, :destroy]

  def index
    render json: ExamQuestion.all
  end

  def show
    render json: @exam_question
  end

  def create
    @exam_question = ExamQuestion.new(resource_params)
    @exam_question.exam = @exam

    if @exam_question.save
      render json: @exam_question
    else
      render json: { errors: @exam_question.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    return render json: { errors: 'Not found' }, status: :not_found unless @exam_question

    if @exam_question.update(resource_params)
      render json: @exam_question
    else
      render json: { errors: @exam_question.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    if @exam_question.destroy
      head :no_content
    else
      render json: { errors: @exam_question.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def resource_params
    params.permit(:question, options: [])
  end

  def load
    @exam_question = ExamQuestion.find_by(id: params[:id])
  end

  def load_exam
    @exam = Exam.find_by(id: params[:exam_id])
  end
end
