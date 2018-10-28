class NewsController < ApplicationController
  def index
    render json: @news
  end

  def show
    render json: @new
  end

  def create
    if @new.save
      render json: @new, status: :created
    else
      render_validation_errors
    end
  end

  def update
    if @new.update(resource_params)
      render json: @new
    else
      render_validation_errors
    end
  end

  def destroy
    if @new.destroy
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
