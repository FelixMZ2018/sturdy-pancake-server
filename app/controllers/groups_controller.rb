class GroupsController < ApplicationController
  def new
    @group = Group.new
  end
  def create
    @group = Group.create(params[:name])
    redirect_to group_path(@group)
  end
  def update
    @group = Group.find(params[:id])
    if @group.update(params)
      redirect_to @group, notice: "Shelf was successfully updated."
    else
      render :edit 
    end
  end
  def show
    @group = Group.find(params[:id])
  end
end
