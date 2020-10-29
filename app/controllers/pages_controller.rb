# frozen_string_literal: true

# This is the pages controller
class PagesController < ApplicationController
  def index
    @group = Group.all
    @plant = Plant.all
  end
end
