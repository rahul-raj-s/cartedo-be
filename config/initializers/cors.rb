Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins '*' # Replace '*' with specific domains if needed
      
      resource '*',
        headers: :any,
        methods: [:get, :post, :put, :patch, :delete, :options, :head],
        expose: ['Authorization'], # Add any custom headers you want to expose to the client
        max_age: 600
    end
end