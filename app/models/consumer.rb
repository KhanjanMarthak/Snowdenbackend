class Consumer < ApplicationRecord
    has_secure_password
    validates_presence_of :first_name, :last_name, :email, :password, :password_confirmation, :address
    validates :email, uniqueness: true
    has_many :favorites
    has_many :service_provider, through: :favorites
end
