class ConsumersController < ApplicationController
  def index
    @consmers = Consumer.all
    if @consmers
      render json: {
      consmers: @consmers
    }
    else
      render json: {
      status: 500,
      errors: ['no consmers found']
    }
    end
  end

  def show
    @consumer = Consumer.find(params[:id])
    if @consumer
      render json: {
      consumer: @consumer
    }
    else
      render json: {
      status: 500,
      errors: ['consumer not found']
    }
    end
  end

  def create
    @consumer = Consumer.new(consumer_params)
    if @consumer.save
      login!  
      render json: {
      status: :created,
      consumer: @consumer
    }
    else 
      render json: {
      status: 500,
      errors: @consumer.errors.full_messages
    }
    end
  end

  private
  def consumer_params
    params.require(:consumer).permit(:first_name, :last_name, :email, :password, :password_confirmation, :address, :latitude, :longitude)
  end
end
