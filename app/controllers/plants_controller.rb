class PlantsController < ApplicationController
    def edit
        @Plant = Plant.find(params[:id])
    end

    def update
        @Plant = Plant.find(params[:id])
        if @Plant.update(params)
          redirect_to @Plant, notice: 'Plant was successfully updated.'
        else
          render :edit
        end
      end
    
    
end
