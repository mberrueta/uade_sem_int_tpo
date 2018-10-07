class TeachersController < ApplicationController
  before_action :load_organization, only: :create
  before_action :load, only: [:show, :update, :destroy]

  def index
    render json: Teacher.all
  end

  def show
    render json: @teacher
  end

  def create
    @teacher = Teacher.new(resource_params)
    @teacher.organization = @organization

    if @teacher.save
      render json: @teacher
    else
      render json: { errors: @teacher.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    return render json: { errors: 'Not found' }, status: :not_found unless @teacher

    if @teacher.update(resource_params)
      render json: @teacher
    else
      render json: { errors: @teacher.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    if @teacher.destroy
      head :no_content
    else
      render json: { errors: @teacher.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def resource_params
    params.permit(:first_name, :last_name, :phone, :address, :gender, :email)
  end

  def load
    @teacher = Teacher.find_by(id: params[:id])
  end
end
