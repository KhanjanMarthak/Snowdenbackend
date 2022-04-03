class ServiceProvider < ApplicationRecord
    has_secure_password
    validates_presence_of :first_name, :last_name, :email, :service, :password, :password_confirmation, :address, :start_time, :end_time
    validates :email, uniqueness: true
    has_many :favorites
    has_many :consumer, through: :favorites

end
