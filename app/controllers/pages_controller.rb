class PagesController < ApplicationController
    def index
        @group = Group.all
        @plant = Plant.all
    end
end
