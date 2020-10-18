class Sensor < ApplicationRecord
    validates_presence_of :type
    validates_presence_of :hardware_id
    validates_presence_of :plant_id, if: Proc.new { |obj| obj.group_id.blank?}
    validates_presence_of :group_id, if: Proc.new { |obj| obj.plant_id.blank?}

    belongs_to :plant, optional: true
    belongs_to :plant, optional: true
    has_many :datapoints, class_name: "datapoint", foreign_key: "reference_id"
end
