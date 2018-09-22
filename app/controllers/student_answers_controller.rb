class StudentAnswersController < ApplicationController
  def index
    render json: @student_answers
  end

  def show
    render json: @student_answer
  end

  def create
    if @student_answer.save
      render json: @student_answer, status: :created
    else
      render_validation_errors
    end
  end

  def update
    if @student_answer.update(resource_params)
      render json: @student_answer
    else
      render_validation_errors
    end
  end

  def destroy
    if @student_answer.destroy
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
