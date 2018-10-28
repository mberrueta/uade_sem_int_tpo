class AssistsController < ApplicationController
  before_action :load_student, only: :create
  before_action :load_course, only: :create
  before_action :load_list, only: :index
  before_action :load, only: [:show, :update, :destroy]

  def index
    render json: @assists
  end

  def show
    render json: @assist
  end

  def create
    @assist = Assist.new(resource_params)
    @assist.student = @student
    @assist.course = @course

    if @assist.save
      render json: @assist
    else
      render json: { errors: @assist.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    return render json: { errors: 'Not found' }, status: :not_found unless @assist

    if @assist.update(resource_params)
      render json: @assist
    else
      render json: { errors: @assist.errors.full_messages }, status: :unprocessable_entity
    end

  end

  def destroy
    if @assist.destroy
      head :no_content
    else
      render json: { errors: @assist.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def resource_params
    params.permit(:date, :present_code, :student_id, :course_id)
  end

  def load_list
    @assists = Assist.all
    @assists = @assists.where(student_id: params[:student_id]) if params[:student_id]
    @assists = @assists.where(course_id: params[:course_id]) if params[:course_id]
    @assists = @assists.where(date: params[:date]) if params[:date]
    @assists
  end

  def load
    @assist = Assist.find_by(id: params[:id])
  end
end
