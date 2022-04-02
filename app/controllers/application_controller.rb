class ApplicationController < ActionController::Base
    skip_before_action :verify_authenticity_token
    helper_method :login!, :logged_in?, :current_consumer, :authorized_consumer?, :logout!, :set_consumer
    helper_method :service_provider_login!, :service_provider_logged_in?, :current_service_provider, :authorized_service_provider?, :service_provider_logout!, :set_service_provider

    #consumer helper methods
    def login!
        session[:consumer_id] = @consumer.id
    end

    def logged_in?
        !!session[:consumer_id]
    end

    def current_consumer
        @current_consumer ||= Consumer.find(session[:consumer_id]) if session[:consumer_id]
    end

    def authorized_consumer?
        @consumer == current_consumer
    end

    def logout!
        session.clear
    end

    def set_consumer
        @consumer = Consumer.find_by(id: session[:consumer_id])
    end

    # service provider helper methods
    def service_provider_login!
        session[:service_provider_id] = @service_provider.id
    end

    def service_provider_logged_in?
        !!session[:service_provider_id]
    end

    def current_service_provider
        @current_service_provider ||= ServiceProvider.find(session[:service_provider_id]) if session[:service_provider_id]
    end

    def authorized_service_provider?
        @service_provider == current_service_provider
    end

    def service_provider_logout!
        session.clear
    end

    def set_service_provider
        @service_provider = ServiceProvider.find_by(id: session[:service_provider_id])
    end
end
