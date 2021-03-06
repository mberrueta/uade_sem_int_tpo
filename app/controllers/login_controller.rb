class LoginController < ApplicationController
  before_action :load_person

  def create
    if @person
      render json: @person
    else
      render json: { errors: 'Invalid dni' }, status: :not_found
    end
  end

  private

  def load_person
    @person = Person.where(dni: params[:dni]).first
  end
end
