class Sensor < ApplicationRecord
    belongs_to :plant, optional: true
    belongs_to :plant, optional: true
    has_many :datapoints, class_name: "datapoint", foreign_key: "reference_id"
end
