# frozen_string_literal: true

class PlantsController < ApplicationController
  def new
    @group = Group.find(params[:id])
    @plant = Plant.new
  end

  def show
    @plant = Plant.find(params[:id])
  end

  def edit
    @plant = Plant.find(params[:id])
  end

  def update
    @plant = Plant.find(params[:id])
    if @plant.update(params)
      redirect_to @plant, notice: "Plant was successfully updated."
    else
      render :edit
    end
  end
end
