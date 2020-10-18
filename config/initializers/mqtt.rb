puts "Starting MQTT Connection"

Thread.new do
    MQTT::Client.connect('192.168.0.26') do |c|
      # If you pass a block to the get method, then it will loop
      c.get('Plants/#') do |topic,message|
        puts "#{topic}: #{message}"
        reading = JSON.parse(message)
        groupname = reading["PlantGroup"]
        plant = reading["Plant"]
        hardware_id = reading["Sensor_ID"]
        sensor_value = reading["SensorValue"]
        !verifyGroup?(groupname) ? Group.create(name: groupname) : nil 
        unless plant == nil
          !verifyPlant?(plant) ? Plant.create(name: plant,group_id: Group.find_by(name: groupname).id) : nil
        end
          !verifySensor?(hardware_id) ? Sensor.create(hardware_id: hardware_id,plant_id: (plant == nil ? nil : Plant.find_by(name: plant).id),group_id: Group.find_by(name: groupname).id) : nil
        Datapoint.create(sensor_id: Sensor.find_by(hardware_id: hardware_id).id,value: sensor_value)
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
  