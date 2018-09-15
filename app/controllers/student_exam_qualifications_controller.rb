class StudentExamQualificationsController < ApplicationController
  def index
    render json: @student_exam_qualifications
  end

  def show
    render json: @student_exam_qualification
  end

  def create
    if @student_exam_qualification.save
      render json: @student_exam_qualification, status: :created
    else
      render_validation_errors
    end
  end

  def update
    if @student_exam_qualification.update(resource_params)
      render json: @student_exam_qualification
    else
      render_validation_errors
    end
  end

  def destroy
    if @student_exam_qualification.destroy
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
