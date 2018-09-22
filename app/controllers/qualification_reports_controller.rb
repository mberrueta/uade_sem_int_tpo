class QualificationReportsController < ApplicationController
  def index
    render json: @qualification_reports
  end

  def show
    render json: @qualification_report
  end

  def create
    if @qualification_report.save
      render json: @qualification_report, status: :created
    else
      render_validation_errors
    end
  end

  def update
    if @qualification_report.update(resource_params)
      render json: @qualification_report
    else
      render_validation_errors
    end
  end

  def destroy
    if @qualification_report.destroy
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
