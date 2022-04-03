class SessionsController < ApplicationController
    def create
        @consumer = Consumer.find_by(email: session_params[:email])
      
        if @consumer && @consumer.authenticate(session_params[:password])
            login!
            render json: {
                logged_in: true,
                consumer: @consumer,
                service_provider: ServiceProvider.all
            }  
        else
            render json: { 
                logged_in: false,
                status: 401,
                errors: ['no such consumer, please try again']
            }
        end
    end

    def is_logged_in?
        if logged_in? && current_consumer
            render json: {
                logged_in: true,
                consumer: current_consumer
            }
        else
            render json: {
                logged_in: false,
                message: 'no such consumer'
            }
        end
    end

    def destroy
        logout!
        render json: {
            status: 200,
            logged_out: true
        }
    end

    private
    def session_params
        params.require(:consumer).permit(:email, :password)
    end
end
