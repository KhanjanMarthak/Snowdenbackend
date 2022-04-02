class ApplicationController < ActionController::Base
    skip_before_action :verify_authenticity_token
    helper_method :login!, :logged_in?, :current_consumer, :authorized_consumer?, :logout!, :set_consumer
    
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
end
