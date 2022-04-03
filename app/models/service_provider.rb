class ServiceProvider < ApplicationRecord
    has_secure_password
    has_many :bookings, dependent: :destroy
    has_many :consumers, through: :bookings

    validates_presence_of :first_name, :last_name, :email, :service, :password, :password_confirmation, :address, :start_time, :end_time
    validates :email, uniqueness: true
    has_many :favorites
    has_many :consumer, through: :favorites

end
