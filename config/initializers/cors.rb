  Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
      # Specify which origins are allowed to make requests
      origins '*' # Use '*' to allow all origins or specify domains like 'http://example.com'

      # Define which resources are accessible and allowed methods
      resource '*',
        headers: :any, # Allow all headers
        methods: [:get, :post, :put, :patch, :delete, :options, :head] # Allow these HTTP methods
    end
  end
