class StudentExamsController < ApplicationController
  def index
    render json: @student_exams
  end

  def show
    render json: @student_exam
  end

  def create
    if @student_exam.save
      render json: @student_exam, status: :created
    else
      render_validation_errors
    end
  end

  def update
    if @student_exam.update(resource_params)
      render json: @student_exam
    else
      render_validation_errors
    end
  end

  def destroy
    if @student_exam.destroy
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
