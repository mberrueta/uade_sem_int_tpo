class StudentExamsController < ApplicationController
  before_action :load_student, only: :create
  before_action :load_exam, only: :create
  before_action :load, only: [:show, :update, :destroy]
  before_action :instantiate, only: :create
  before_action :load_list, only: :index

  def index
    render json: @student_exams
  end

  def show
    render json: @student_exam, include: [:student, :student_answers, :student_exam_qualification, exam: :exam_questions]
  end

  def create
    if @student_exam.save
      render json: @student_exam, include: [exam: :exam_questions]
    else
      render json: { errors: @student_exam.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    return render json: { errors: 'Not found' }, status: :not_found unless @student_exam

    if @student_exam.update(resource_params)
      render json: @student_exam
    else
      render_validation_errors
    end
  end

  def destroy
    if @student_exam.destroy
      head :no_content
    else
      render_validation_errors
    end
  end

  private

  def instantiate
    @student_exam = StudentExam.new(resource_params)
    @student_exam.student = @student
    @student_exam.exam = @exam
  end

  def resource_params
    params.permit(:exam_id)
  end

  def load
    @student_exam = StudentExam.find_by(id: params[:id])
  end

  def load_list
    @student_exams = StudentExam.all
    @student_exams = @student_exams.where(student_id: params[:student_id]) if params[:student_id]
    @student_exams = @student_exams.where(exam_id: params[:exam_id]) if params[:exam_id]
    @student_exams = @student_exams.joins(:exam).where(exams: { lesson_id: params[:lesson_id] }) if params[:lesson_id]
  end
end
