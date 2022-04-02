class ServiceProvidersController < ApplicationController
  def index
    @service_providers = ServiceProvider.all
    if @service_providers
      render json: {
      service_providers: @service_providers
    }
    else
      render json: {
        status: 500,
        errors: ['no service providers found']
    }
    end
  end

  def show
    @service_provider = ServiceProvider.find(params[:id])
    if @service_provider
       render json: {
        service_providers: @service_provider
    }
    else
       render json: {
       status: 500,
       errors: ['service provider not found']
     }
    end
  end

  def create
    @service_provider = ServiceProvider.new(service_provider_params)
      if @service_provider.save
        service_provider_login!  
        render json: {
        status: :created,
        service_providers: @service_provider
      }
    else 
      render json: {
      status: 500,
      errors: @service_provider.errors.full_messages
    }
    end
  end

  private    
  def service_provider_params
    params.require(:service_provider).permit(:first_name, :last_name, :email, :service, :address, :latitude, :longitude, :start_time, :end_time, :password, :password_confirmation)
  end
end