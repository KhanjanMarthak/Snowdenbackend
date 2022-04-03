class Favorite < ApplicationRecord
    belongs_to :consumer
    belongs_to :service_provider
end
