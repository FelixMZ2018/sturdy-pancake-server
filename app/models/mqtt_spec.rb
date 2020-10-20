require 'rails_helper'
payload1 = {Plant_Group:"Living Room Corner",Plant_Name:"Magnificient Monstera",Sensor_Type: "Soil Moisture",Sensor_ID: 2,Sensor_Value: -4}
payload2 = {PlantGroup:"Living Room Corner",Plant:"Fancy Ficus",Sensor_Type: "Soil Moisture",Sensor_ID: 1,SensorValue:10}
payload3 = {PlantGroup:"Living Room Corner",Plant: "null" ,Sensor_Type: "Brightness",Sensor_ID: 3,SensorValue: 5}
interpret_message(payload1)
#interpret_message(payload2)
#interpret_message(payload3)