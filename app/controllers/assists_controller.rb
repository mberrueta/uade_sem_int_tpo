class AssistsController < ApplicationController
  def index
    render json: @assists
  end

  def show
    render json: @assist
  end

  def create
    if @assist.save
      render json: @assist, status: :created
    else
      render_validation_errors
    end
  end

  def update
    if @assist.update(resource_params)
      render json: @assist
    else
      render_validation_errors
    end
  end

  def destroy
    if @assist.destroy
      head :no_content
    else
      render_validation_errors
    end
  end

  private

  def resource_params
    params.permit(:name, :organization_id)
  end
end
