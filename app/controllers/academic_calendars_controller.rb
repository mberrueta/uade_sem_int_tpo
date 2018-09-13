class AcademicCalendarsController < ApplicationController
  before_action :load_organization, only: :create
  before_action :load, only: [:show, :update, :destroy]

  def index
    render json: AcademicCalendar.all
  end

  def show
    render json: @academic_calendar
  end

  def create
    @academic_calendar = AcademicCalendar.new(resource_params)
    @academic_calendar.organization = @organization

    if @academic_calendar.save
      render json: @academic_calendar
    else
      render json: { errors: @academic_calendar.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    return render json: { errors: 'Not found' }, status: :not_found unless @academic_calendar

    if @academic_calendar.update(resource_params)
      render json: @academic_calendar
    else
      render json: { errors: @academic_calendar.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    if @academic_calendar.destroy
      head :no_content
    else
      render json: { errors: @academic_calendar.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def resource_params
    params.permit(:calendar_type, :year)
  end

  def load
    @academic_calendar = AcademicCalendar.find_by(id: params[:id])
  end

  def load_organization
    @organization = Organization.find_by(id: params[:organization_id])
  end
end
