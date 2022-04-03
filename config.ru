# This file is used by Rack-based servers to start the application.

require_relative "config/environment"

run Rails.application
Rails.application.load_server

use Rack::Cors do
    allow do
      origins 'https://sarthi-frontend-1.herokuapp.com/home'
  
      resource '*',
        headers: :any,
        methods: [:get, :post, :put, :patch, :delete, :options, :head]
        #credentials: false
    end
  end