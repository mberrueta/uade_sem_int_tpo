class CoursesController < ApplicationController
  before_action :load_academic_calendar, only: :create
  before_action :load, only: [:show, :update, :destroy]

  def index
    render json: Course.all
  end

  def show
    render json: @course
  end

  def create
    @course = Course.new(resource_params)
    @course.academic_calendar = @academic_calendar

    if @course.save
      render json: @course
    else
      render json: { errors: @course.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    return render json: { errors: 'Not found' }, status: :not_found unless @course

    if @course.update(resource_params)
      render json: @course
    else
      render json: { errors: @course.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    if @course.destroy
      head :no_content
    else
      render json: { errors: @course.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def resource_params
    params.permit(:name, :max_students)
  end

  def load
    @course = Course.find_by(id: params[:id])
  end

  def load_academic_calendar
    @academic_calendar = AcademicCalendar.find_by(id: params[:academic_calendar_id])
  end
end
