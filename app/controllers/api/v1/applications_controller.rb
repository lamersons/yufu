class Api::V1::ApplicationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile
  before_action :set_application, except: [:index, :create]

  respond_to :json

  def create
    @application = @profile.applications.new application_params
    if @application.save
      respond_with @application, statue: :created, location: api_v1_application_url(@application)
    else
      respond_with @application.errors, status: :unprocessable_entity
    end
  end

  # Can update only status
  def update
    if @application.update status: params[:order_application][:status]
      respond_with @application, statue: :updated, location: api_v1_application_url(@application)
    else
      respond_with @application.errors, status: :unprocessable_entity
    end
  end

  def show
    respond_with @application
  end

  def index
    @applications = @profile.applications
    respond_with @applications, root: 'order_applications'
  end

  def default_serializer_options
    {root: 'order_application'}
  end

  protected
  def application_params
    params.require(:order_application).permit :order_id, :status
  end
  def set_application
    @application = @profile.applications.find params[:id]
  end
  def set_profile
    @profile = Profile::Base.find params[:profile_id]
  end
end
