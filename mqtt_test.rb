require 'rubygems'
require 'mqtt'
MQTT::Client.connect('192.168.0.26') do |c|
    # If you pass a block to the get method, then it will loop
    c.get('#') do |topic,message|
      puts "#{topic}: #{message}"
    end
  end
### MQTT::Client.connect('192.168.0.26') do |c|
###   # If you pass a block to the get method, then it will loop
###   c.get("PlantGroup1") do |topic,message|
###     puts "#{topic}: #{message}"
###   end
### end