class BookingsController < ApplicationController
  def create
    @booking = current_consumer.bookings.build(booking_params)
    @booking.status = "pending"
    if @booking.save 
      render json: {
        status: :created,
        booking: @booking
      }
    else 
      render json: {
        status: 500,
        errors: @booking.errors.full_messages
      }
    end
  end

  def show
    @booking = Booking.find(params[:id])
    if @booking
      render json: {
      booking: @booking
    }
    else
      render json: {
      status: 500,
      errors: ['booking not found']
    }
    end
  end

  def update
    @booking = Booking.find(params[:id])
    if @booking
      @booking.update(booking_params)
      render json: {
        booking: @booking
      }
      else
        render json: {
        status: 500,
        errors: @booking.errors.full_messages
      }
    end
  end

  private
  def booking_params
    params.require(:booking).permit(:booking_date, :status, :consumer_id, :service_provider_id)
  end
end
