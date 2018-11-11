class LessonsController < ApplicationController
  before_action :load_subject, only: :create
  before_action :load, only: [:show, :update, :destroy]
  before_action :load_list, only: :index

  def index
    render json: @lessons
  end

  def show
    render json: @lesson
  end

  def create
    lesson = Lesson.new(resource_params)
    lesson.subject = @subject

    if lesson.save
      render json: lesson
    else
      render json: { errors: lesson.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    return render json: { errors: 'Not found' }, status: :not_found unless @lesson

    if @lesson.update(resource_params)
      render json: @lesson
    else
      render json: { errors: @lesson.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    if @lesson.destroy
      head :no_content
    else
      render json: { errors: @lesson.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def resource_params
    params.permit(:date, :done, :class_number, :subject_id, :title, :description, :picture_url)
  end

  def load
    @lesson = Lesson.find_by(id: params[:id])
  end

  def load_list
    @lessons = Lesson.where(subject_id: params[:subject_id]) if params[:subject_id]
    @lessons = Lesson.joins(:subject).where(subjects: { teacher_id: params[:teacher_id] }) if params[:teacher_id]
    @lessons ||= Lesson.all
  end
end
