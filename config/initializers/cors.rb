# frozen_string_literal: true

# config/initializers/cors.rb

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'http://127.0.0.1:3000' # Replace with your frontend URL

    resource '/api/v1/*',
             headers: :any,
             methods: %i[get post put patch delete options],
             credentials: true
  end

  allow do
    origins 'http://127.0.0.1:3000' # Replace with your frontend URL

    resource '/login',
             headers: :any,
             methods: [:post], # Adjust with the method used for login
             credentials: true
  end
end
