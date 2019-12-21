class TasksController < ApplicationController
    def index
        @incomplete_tasks = Task.where(complete: false)
        @complete_tasks = Task.where(complete: true)
    end

    def show
        @task = current_user.tasks.find(params[:id])
    end

    def new
        @task = current_user.tasks.build
    end

    def edit
        @task = Task.find(params[:id])
    end

    def create
        @task = current_user.tasks.build(task_params)

        if @task.save
        redirect_to @task
        else 
            render 'new'
        end
    end

    def update
        @task = Task.find(params[:id])

        if @task.update(task_params)
            redirect_to @task
        else
            render 'edit'
        end
    end

    def destroy
        @task = Task.find(params[:id])
        @task.destroy

        redirect_to tasks_path
    end

    def complete
        @task = current_user.tasks.find(params[:id])
        @task.update_attribute(:complete, true)
        flash[:notice] = "Task Marked as Complete"
        redirect_to tasks_path
    end
    
    private 
        def task_params
            params.require(:task).permit(:item, :description, :tag_list, :due)  
        end
end
