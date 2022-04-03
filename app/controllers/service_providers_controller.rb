class ServiceProvidersController < ApplicationController
  before_action :require_login, except: [:create, :dashboard]
  before_action :require_sp_login, only: :dashboard
  
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

  def filter_service_provider
    @service_providers=ServiceProvider.where(service: params[:service])
    if @service_providers.present?
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

  def set_provider_favorites
    @favorite=Favorite.create(consumer_id:current_consumer.id,service_provider_id: params[:service_provider_id],is_favorite: params[:favorite])
    if @favorite.save
      render json: {
      status: 200
   }
   else
      render json: {
      status: 500,
      errors: ['could not mark service provider as favorite']
    }
  end
  end

  def show_favorites
    @favorite = Favorite.where(consumer_id: current_consumer.id ,is_favorite: true)
    if @favorite
      render json: {
        favorites: @favorite
   }
   else
      render json: {
      status: 500,
      errors: ['unable to find favorites']
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

  def dashboard 
    @bookings = current_service_provider.bookings
    if @bookings
      render json: {
        bookings: @bookings
      }
    else 
      render json: {
        status: 500,
        errors: ['No bookings yet!']
      }
    end
  end

  private    
  def service_provider_params
    params.require(:service_provider).permit(:first_name, :last_name, :email, :service, :address, :latitude, :longitude, :start_time, :end_time, :password, :password_confirmation, :phone)
  end
end