class FeedbackController < ApplicationController
  before_action :load, only: [:show, :update, :destroy]
  before_action :load_list, only: :index

  before_action :load_lesson, only: :create
  before_action :load_manager, only: :create
  before_action :load_teacher, only: :create
  before_action :load_student, only: :create
  before_action :load_exam, only: :create
  before_action :instantiate, only: :create

  def index
    render json: @feedback
  end

  def show
    render json: @feedback, serializer: ::FeedbackSerializer
  end

  def create
    if @feedback.save
      render json: @feedback
    else
      render json: { errors: @feedback.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    return render json: { errors: 'Not found' }, status: :not_found unless @feedback

    if @feedback.update(resource_params)
      render json: @feedback
    else
      render json: { errors: @feedback.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    if @feedback.destroy
      head :no_content
    else
      render json: { errors: @feedback.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def resource_params
    params.permit(:value, :comments, :viewed)
  end

  def load
    @feedback = Feedback.find_by(id: params[:id])
  end

  def load_list
    @feedback = Feedback.where(to_id: params[:teacher_id]) if params[:teacher_id]
    @feedback = Feedback.where(to_id: params[:manager_id]) if params[:manager_id]
    @feedback = Feedback.where(to_id: params[:lesson_id]) if params[:lesson_id]
    @feedback = Feedback.where(to_id: params[:exam_id]) if params[:exam_id]
    @feedback ||= Feedback.all
    @feedback = @feedback.where(student_id: params[:student_id]) if params[:student_id]
    @feedback = @feedback.where(grouped_lesson_id: params[:grouped_lesson_id]) if params[:grouped_lesson_id]
    @feedback = @feedback.where(viewed: false) if params[:unread]
  end

  def instantiate
    @feedback = Feedback.new(resource_params)
    @feedback.student = @student
    @feedback.to = @lesson || @teacher || @manager || @exam
  end
end
