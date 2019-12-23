class TagsController < ApplicationController
    def show
        @tag = current_user.tags.find(params[:id])
    end

    def index
        @tag = current_user.tags.all 
    end
end
