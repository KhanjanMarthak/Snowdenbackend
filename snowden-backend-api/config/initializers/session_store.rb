if Rails.env === 'production' 
    Rails.application.config.session_store :cookie_store, key: '_snowden-backend-api', domain: 'snowden-backend-api'
else
    Rails.application.config.session_store :cookie_store, key: '_snowden-backend-api'
end
