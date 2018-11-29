class StudentAnswersController < ApplicationController
  before_action :load_student_exam, only: :create
  before_action :load_exam_question, only: :create
  before_action :load, only: [:show, :update, :destroy]
  before_action :instantiate, only: :create
  before_action :load_list, only: :index

  def index
    render json: @student_answers
  end

  def show
    render json: @student_answer
  end

  def create
    if @student_answer.save
      render json: @student_answer
    else
      render json: { errors: @student_answer.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    return render json: { errors: 'Not found' }, status: :not_found unless @student_answer

    if @student_answer.update(resource_params)
      render json: @student_answer
    else
      render_validation_errors
    end
  end

  def destroy
    if @student_answer.destroy
      head :no_content
    else
      render_validation_errors
    end
  end

  private

  def instantiate
    @student_answer = StudentAnswer.new(resource_params)
    @student_answer.student_exam = @student_exam
    @student_answer.exam_question = @exam_question
  end

  def resource_params
    params.permit(:answer)
  end

  def load
    @student_answer = StudentAnswer.find_by(id: params[:id])
  end

  def load_list
    @student_answers = StudentAnswer.all
    @student_answers = @student_answers.where(student_exam_id: params[:student_exam_id]) if params[:student_exam_id]
  end
end
