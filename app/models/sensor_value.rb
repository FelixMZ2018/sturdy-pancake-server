class SensorValue < ApplicationRecord
    belongs_to :sensor, class_name: "sensor", foreign_key: "sensor_id"
end
