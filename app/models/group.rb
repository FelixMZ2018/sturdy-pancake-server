# frozen_string_literal: true

class Group < ApplicationRecord
  has_many :plants
  has_many :sensors, through: :plants
end
