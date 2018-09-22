class ApplicationController < ActionController::API
  def load_organization
    @organization = Organization.find_by(id: params[:organization_id])
  end
end
