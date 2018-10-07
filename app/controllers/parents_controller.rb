class ParentsController < ApplicationController
  before_action :load_student, only: :create
  before_action :load, only: [:show, :update, :destroy]

  def index
    render json: Parent.all
  end

  def show
    render json: @parent
  end

  def create
    @parent = Parent.new(resource_params.merge(organization_id: @student.organization.id))
    @parent.student_ids << @student.id

    if @parent.save
      render json: @parent
    else
      render json: { errors: @parent.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    return render json: { errors: 'Not found' }, status: :not_found unless @parent

    if @parent.update(resource_params)
      render json: @parent
    else
      render json: { errors: @parent.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    if @parent.destroy
      head :no_content
    else
      render json: { errors: @parent.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def resource_params
    params.permit(:first_name, :last_name, :phone, :address, :gender, :email, students: [])
  end

  def load
    @parent = Parent.find_by(id: params[:id])
  end

  def load_student
    @student = Student.find_by(id: params[:student_id])
  end
end
