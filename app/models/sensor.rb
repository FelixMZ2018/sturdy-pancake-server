class Sensor < ApplicationRecord
    belongs_to :plant
    has_many :datapoints, class_name: "datapoint", foreign_key: "reference_id"
end
