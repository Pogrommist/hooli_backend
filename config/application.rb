require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Hooli
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    config.autoload_paths << Rails.root.join('lib', 'services')

    if defined? Dotenv::Railtie
      Dotenv::Railtie.load
    end

    config.middleware.use Rack::Cors do
      allow do
        origins ENV['AVAILABLE_ORIGIN']
        resource '*',
                 :headers => :any,
                 :expose  => ['access-token', 'expiry', 'token-type', 'uid', 'client', 'Authorization'],
                 :methods => [:get, :post, :options, :delete, :put]
      end
    end

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
