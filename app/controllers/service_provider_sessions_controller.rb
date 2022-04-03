class ServiceProviderSessionsController < ApplicationController
    def create
        @service_provider = ServiceProvider.find_by(email: session_params[:email])
      
        if @service_provider && @service_provider.authenticate(session_params[:password])
            service_provider_login!
            render json: {
                service_provider_logged_in: true,
                service_provider: @service_provider
            }  
        else
            render json: { 
                logged_in: false,
                status: 401,
                errors: ['no such service_provider, please try again']
            }
        end
    end

    def is_service_provider_logged_in?
        if service_provider_logged_in? && current_service_provider
            render json: {
                service_provider_logged_in: true,
                service_provider: current_service_provider
            }
        else
            render json: {
                service_provider_logged_in: false,
                message: 'no such service_provider'
            }
        end
    end

    def destroy
        service_provider_logout!
        render json: {
            status: 200,
            service_provider_logged_out: true
        }
    end

    private
    def session_params
        params.require(:service_provider).permit(:email, :password)
    end
end
