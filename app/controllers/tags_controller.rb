class TagsController < ApplicationController
    def show
        @tag = current_user.tag.find(params[:id])
    end

    def index
        @tag = current_user.tag.all 
    end
end
