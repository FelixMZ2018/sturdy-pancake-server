# frozen_string_literal: true

puts 'Starting MQTT Connection'

Thread.new do
  MQTT::Client.connect('192.168.0.26') do |c|
    # If you pass a block to the get method, then it will loop
    c.get('Plants/#') do |topic, message|
      puts "#{topic}: #{message}"
      reading = JSON.parse(message)
      puts "Message recieved:"
      puts reading
      interpret_message(reading)
    end
  end
end

def interpret_message(reading)
  groupname = reading['Plant_Group']
  plant = reading['Plant_Name']
  hardware_id = reading['Sensor_ID']
  sensor_value = reading['Sensor_Value']
  sensor_type = reading['Sensor_Type']
  !verifyGroup?(groupname) ? Group.create(name: groupname) : nil
  unless plant.nil?
    !verifyPlant?(plant) ? Plant.create(name: plant, group_id: Group.find_by(name: groupname).id) : nil
  end
  unless verifySensor?(hardware_id)
    Sensor.create(Sensor_Type: sensor_type,hardware_id: hardware_id, plant_id: (plant.nil? ? nil : Plant.find_by(name: plant).id), group_id: Group.find_by(name: groupname).id)
  end
  Datapoint.create(sensor_id: Sensor.find_by(hardware_id: hardware_id).id, value: sensor_value)
end

def verifyGroup?(groupname)
  if GROUP_ARRAY.include?(groupname)
    true
  elsif !Group.where(name: groupname).empty?
    GROUP_ARRAY << groupname
    true
  else
    GROUP_ARRAY << groupname
    false
  end
end

def verifySensor?(id)
  p id
  if SENSOR_ARRAY.include?(id)
    true
  elsif !Sensor.where(hardware_id: id).empty?
    SENSOR_ARRAY << id
    true
  else
    SENSOR_ARRAY << id
    false
  end
end

def verifyPlant?(name)
  if PLANT_ARRAY.include?(name)
    true
  elsif !Plant.where(name: name).empty?
    PLANT_ARRAY << name
    true
  else
    PLANT_ARRAY << name
    false
  end
end
