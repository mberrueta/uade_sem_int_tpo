class StudentExamQualificationsController < ApplicationController
  before_action :load, only: :update

  def update
    if @student_exam_qualification.update(resource_params)
      render json: @student_exam_qualification
    else
      render_validation_errors
    end
  end

  private

  def resource_params
    params.permit(:result, :notes)
  end

  def load
    @student_exam_qualification = StudentExamQualification.find_by(id: params[:id])
  end
end
