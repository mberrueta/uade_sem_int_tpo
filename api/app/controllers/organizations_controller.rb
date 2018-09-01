class OrganizationsController < ApplicationController
  before_action :load, only: [:show, :update, :destroy]

  def index
    render json: Organization.all
  end

  def show
    render json: @organization
  end

  def create
    @organization = Organization.new(resource_params)

    if @organization.save
      render json: @organization
    else
      render json: { errors: @organization.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    return render json: { errors: 'Not found' }, status: :not_found unless @organization

    if @organization.update(resource_params)
      render json: @organization
    else
      render json: { errors: @organization.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    if @organization.destroy
      head :no_content
    else
      render json: { errors: @organization.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def resource_params
    # params.require(:name)
    params.permit(:name, :page, :phone, :address)
  end

  def load
    @organization = Organization.find_by(id: params[:id])
  end
end
