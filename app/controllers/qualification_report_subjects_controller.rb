class QualificatioReportSubjectsController < ApplicationController
  def index
    render json: @qualification_report_subjects
  end

  def show
    render json: @qualification_report_subject
  end

  def create
    if @qualification_report_subject.save
      render json: @qualification_report_subject, status: :created
    else
      render_validation_errors
    end
  end

  def update
    if @qualification_report_subject.update(resource_params)
      render json: @qualification_report_subject
    else
      render_validation_errors
    end
  end

  def destroy
    if @qualification_report_subject.destroy
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
