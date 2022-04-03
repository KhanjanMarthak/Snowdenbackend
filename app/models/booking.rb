class Booking < ApplicationRecord
    validates_presence_of :booking_date, :service_provider_id, :consumer_id
    belongs_to :consumer
    belongs_to :service_provider
    enum status: [:pending, :accepted, :denied]
end
