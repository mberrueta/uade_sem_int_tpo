class NewsController < ApplicationController
  def index
    render json: @newss
  end

  def show
    render json: @news
  end

  def create
    if @news.save
      render json: @news, status: :created
    else
      render_validation_errors
    end
  end

  def update
    if @news.update(resource_params)
      render json: @news
    else
      render_validation_errors
    end
  end

  def destroy
    if @news.destroy
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
