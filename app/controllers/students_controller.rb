class StudentsController < ApplicationController
  before_action :load_organization, only: :create
  before_action :load, only: [:show, :update, :destroy]
  before_action :load_list, only: :index

  def index
    render json: @students
  end

  def show
    render json: @student, include: [:course, qualification_report: { qualification_report_subjects: :subject }]
  end

  def create
    @student = Student.new(resource_params)
    @student.organization = @organization

    if @student.save
      render json: @student
    else
      render json: { errors: @student.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    return render json: { errors: 'Not found' }, status: :not_found unless @student

    if @student.update(resource_params)
      render json: @student
    else
      render json: { errors: @student.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    if @student.destroy
      head :no_content
    else
      render json: { errors: @student.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def resource_params
    params.permit(:first_name, :last_name, :dni, :phone, :address, :gender, :email, :course_id)
  end

  def load
    @student = Student.find_by(id: params[:id])
  end

  def load_list
    @students = Student.all
    @students = @students.where(course_id: params[:course_id]) if params[:course_id]
    @students
  end
end
