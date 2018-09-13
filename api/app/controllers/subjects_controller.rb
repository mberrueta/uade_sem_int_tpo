class SubjectsController < ApplicationController
  before_action :load_course, only: :create
  before_action :load, only: [:show, :update, :destroy]

  def index
    render json: Subject.all
  end

  def show
    render json: @subject
  end

  def create
    @subject = Subject.new(resource_params)
    @subject.course = @course

    if @subject.save
      render json: @subject
    else
      render json: { errors: @subject.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    return render json: { errors: 'Not found' }, status: :not_found unless @subject

    if @subject.update(resource_params)
      render json: @subject
    else
      render json: { errors: @subject.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    if @subject.destroy
      head :no_content
    else
      render json: { errors: @subject.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def resource_params
    params.permit(:name, :max_students)
  end

  def load
    @subject = Subject.find_by(id: params[:id])
  end

  def load_course
    @course = Course.find_by(id: params[:course_id])
  end
end
