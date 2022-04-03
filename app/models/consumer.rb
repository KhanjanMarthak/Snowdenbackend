class Consumer < ApplicationRecord
    has_secure_password
    has_many :bookings, dependent: :destroy
    has_many :service_providers, through: :bookings

    validates_presence_of :first_name, :last_name, :email, :password, :password_confirmation, :address
    validates :email, uniqueness: true
end
