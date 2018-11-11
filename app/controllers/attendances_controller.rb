class AttendancesController < ApplicationController
  before_action :load_student, only: :create
  before_action :load_course, only: :create
  before_action :load_list, only: :index
  before_action :load, only: [:show, :update, :destroy]

  def index
    render json: @attendances
  end

  def show
    render json: @attendance
  end

  def create
    @attendance = Attendance.new(resource_params)
    @attendance.student = @student
    @attendance.course = @course

    if @attendance.save
      render json: @attendance
    else
      render json: { errors: @attendance.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    return render json: { errors: 'Not found' }, status: :not_found unless @attendance

    if @attendance.update(resource_params)
      render json: @attendance
    else
      render json: { errors: @attendance.errors.full_messages }, status: :unprocessable_entity
    end

  end

  def destroy
    if @attendance.destroy
      head :no_content
    else
      render json: { errors: @attendance.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def resource_params
    params.permit(:date, :present_code, :student_id, :course_id)
  end

  def load_list
    @attendances = Attendance.all
    @attendances = @attendances.where(student_id: params[:student_id]) if params[:student_id]
    @attendances = @attendances.where(course_id: params[:course_id]) if params[:course_id]
    @attendances = @attendances.where(date: params[:date]) if params[:date]
    @attendances
  end

  def load
    @attendance = Attendance.find_by(id: params[:id])
  end
end
