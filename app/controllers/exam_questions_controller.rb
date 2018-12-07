class ExamQuestionsController < ApplicationController
  before_action :load_exam, only: :create
  before_action :load, only: [:show, :update, :destroy]
  before_action :load_list, only: :index

  def index
    render json: @exam_questions
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

  def load_list
    @exam_questions = ExamQuestion.where(exam_id: params[:exam_id]).order(:created_at) if params[:exam_id]
    @exam_questions ||= ExamQuestion.all
  end
end
