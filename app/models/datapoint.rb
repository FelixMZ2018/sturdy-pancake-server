# frozen_string_literal: true

class Datapoint < ApplicationRecord
  validates_presence_of :sensor_id
  validates_presence_of :value
end
