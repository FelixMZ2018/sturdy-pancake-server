class Sensor < ApplicationRecord
    belongs_to :plant
    has_many :sensor_values, class_name: "sensor_value", foreign_key: "sensor_value_id"
end
