Rails.application.config.middleware.insert_before 0, Rack::Cors, debug: true, logger: (-> { Rails.logger }) do
  allow do
    origins 'localhost:8080'

    resource '*',
             headers: :any,
             credentials: true,
             methods: [:get, :post, :options, :delete, :put, :patch]
  end
end