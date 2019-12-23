class TagsController < ApplicationController
    def show
<<<<<<< HEAD
        @tag = current_user.tags.find(params[:id])
    end

    def index
        @tag = current_user.tags.all 
=======
        @tag =  ActsAsTaggableOn::Tag.find(params[:id])
        @tasks = Task.tagged_with(@tag.name)
      end

    def index
        @tags = ActsAsTaggableOn::Tag.all
>>>>>>> 8fe445ae8b398d0562b4ec663dd5069df9a43f3a
    end

end
