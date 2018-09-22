class PersonsController < ApplicationController
  def index
    render json: @people
  end

  def show
    render json: @person
  end

  def create
    if @person.save
      render json: @person, status: :created
    else
      render_validation_errors
    end
  end

  def update
    if @person.update(resource_params)
      render json: @person
    else
      render_validation_errors
    end
  end

  def destroy
    if @person.destroy
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
