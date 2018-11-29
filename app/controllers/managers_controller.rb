class ManagersController < ApplicationController
  before_action :load_organization, only: :create
  before_action :load, only: [:show, :update, :destroy]

  def index
    render json: Manager.all
  end

  def show
    render json: @manager, serializer: ::ManagerSerializer
  end

  def create
    @manager = Manager.new(resource_params)
    @manager.organization = @organization

    if @manager.save
      render json: @manager
    else
      render json: { errors: @manager.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    return render json: { errors: 'Not found' }, status: :not_found unless @manager

    if @manager.update(resource_params)
      render json: @manager
    else
      render json: { errors: @manager.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    if @manager.destroy
      head :no_content
    else
      render json: { errors: @manager.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def resource_params
    params.permit(:first_name, :last_name, :dni, :phone, :address, :gender, :email)
  end

  def load
    @manager = Manager.find_by(id: params[:id])
  end
end
