class TagsController < ApplicationController
    def show
        @tag =  ActsAsTaggableOn::Tag.find(params[:id])
        @tasks = Task.tagged_with(@tag.name)
      end

    def index
        @tags = ActsAsTaggableOn::Tag.all
    end

end
