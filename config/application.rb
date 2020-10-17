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

Thread.new do
  MQTT::Client.connect('192.168.0.26') do |c|
    # If you pass a block to the get method, then it will loop
    c.get('Plants/#') do |topic,message|
      puts "#{topic}: #{message}"
      reading = JSON.parse(message)
      plant = reading["Plant"]
      groupname = reading["PlantGroup"]
      hardware_id = reading["Sensor_ID"]
      if !verifyGroup?(groupname) 
        Group.create(name: groupname)
      end
      if !verifyPlant?(plant)
        Plant.create(name: plant,group_id: Group.find_by(name: groupname).id)
      end
      if !verifySensor?(hardware_id)
        Sensor.create(hardware_id: hardware_id,plant_id: Plant.find_by(name: plant).id)
      end
      SensorValue.create(sensor_id: Sensor.find_by(hardware_id: hardware_id).id)
    end
  end
end

def verifyGroup?(groupname)
  if GROUP_ARRAY.include?(groupname)
    return true
  elsif !Group.where(name: groupname).empty?
    GROUP_ARRAY << groupname
    return true
  else
    GROUP_ARRAY << groupname
    return false
  end
end

def verifySensor?(id)
  p id
  if SENSOR_ARRAY.include?(id)
    return true
  elsif !Sensor.where(hardware_id: id).empty?
    SENSOR_ARRAY << id
    return true
  else
    SENSOR_ARRAY << id
    return false
  end
end

def verifyPlant?(name)
  if PLANT_ARRAY.include?(name)
    return true
  elsif !Plant.where(name: name).empty?
    PLANT_ARRAY << name
    return true
  else
    PLANT_ARRAY << name
    return false
  end
end
