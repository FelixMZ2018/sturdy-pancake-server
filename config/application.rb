require_relative 'boot'

require 'rails/all'
require 'rubygems'
require 'mqtt'
require 'json'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

SENSOR_ARRAY = []
GROUP_ARRAY = []
PLANT_ARRAY = []

##Sensor.destroy_all
##Plant.destroy_all
##Group.destroy_all

module SturdyPancakeServer
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0


    
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
