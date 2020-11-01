# frozen_string_literal: true

class DatapointController < ApplicationController
  def normalize(data, high, low)
    (1 - ((data - high) / (low - high)))
  end
end
