class TasksController < ApplicationController
    def index
        @tasks = Task.all.order("updated_at DESC")
        @categories = Category.all
    end

    def new                         
        @task = Task.new
    end

    def show
        @task = Task.find(params[:id])
    end

    def create
        @task = Task.new(task_params)

        if @task.valid?
            @task.save
            redirect_to root_path, notice: 'Task was created successfully.'
            
        else
            render :new
        end
    end

    def edit
        @task = Task.find(params[:id])
    end

    def update
        @task = Task.find(params[:id])
        if @task.update(task_params)
            redirect_to root_path, notice: 'Task was updated successfully.'
        else
            render :edit
        end
    end

    def destroy
        @task = Task.find(params[:id])
        @task.destroy
        redirect_to root_path, notice: 'Task was deleted successfully.'
    end

    private
    def task_params
        params.require(:task).permit(:title, :body, :deadline, :category_id)
    end

end
