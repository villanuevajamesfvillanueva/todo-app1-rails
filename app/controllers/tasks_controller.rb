class TasksController < ApplicationController
    def index
        @tasks = current_user.tasks.order("updated_at DESC")
        @categories = current_user.categories
    end

    def tasks_list
        @tasks = current_user.tasks.order("deadline ASC")
        @categories = current_user.categories
    end

    def new
        @categories = current_user.categories
        @tasks = current_user.tasks         
        @task = Task.new
    end

    def show
        @categories = current_user.categories
        @tasks = current_user.tasks 
        @task = Task.find(params[:id])
    end

    def create
        @categories = current_user.categories
        @tasks = current_user.tasks 
        @task = Task.new(task_params)

        if @task.valid?
            @task.save
            redirect_to root_path, notice: 'Task was created successfully.'
            
        else
            render :new
        end
    end

    def edit
        @categories = current_user.categories
        @tasks = current_user.tasks 
        @task = Task.find(params[:id])
    end

    def update
        @categories = current_user.categories
        @tasks = current_user.tasks 
        @task = Task.find(params[:id])
        if @task.update(task_params)
            redirect_to root_path, notice: 'Task was updated successfully.'
        else
            render :edit
        end
    end

    def update_status
        @categories = current_user.categories
        @tasks = current_user.tasks 
        @task = Task.find(params[:id])
        @task.update(status: params[:status])
        
    end

    def destroy
        @categories = current_user.categories
        @tasks = current_user.tasks 
        @task = Task.find(params[:id])
        @task.destroy
        redirect_to root_path, notice: 'Task was deleted successfully.'
    end

    private
    def task_params
        params.require(:task).permit(:title, :body, :deadline, :category_id, :status)
    end

end
