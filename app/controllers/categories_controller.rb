class CategoriesController < ApplicationController
    def index
        @categories = current_user.categories.order("updated_at DESC")
        @tasks = current_user.tasks
    end

    def new
        @categories = current_user.categories
        @tasks = current_user.tasks                        
        @category = Category.new
    end

    
    #for destroying categories, corresponding fk to tasks tables should be deleted
    def show
        @categories = current_user.categories
        @tasks = current_user.tasks 
        @category = Category.find(params[:id])
    end

    def create
        @categories = current_user.categories
        @tasks = current_user.tasks 
        @category = current_user.categories.build(category_params)

        if @category.valid?
            @category.save
            redirect_to root_path, notice: 'Category was created successfully.'
            
        else
            render :new
        end
    end

    def edit
        @categories = current_user.categories
        @tasks = current_user.tasks
        @category = Category.find(params[:id])
    end

    def update
        @categories = current_user.categories
        @tasks = current_user.tasks
        @category = Category.find(params[:id])
        if @category.update(category_params)
            redirect_to root_path, notice: 'Category was updated successfully.'
        else
            render :edit
        end
    end

    
    def destroy
        @categories = current_user.categories
        @tasks = current_user.tasks
        @category = Category.find(params[:id])
        @category.destroy
        redirect_to root_path, notice: 'Category was deleted successfully.'
    end
    

    private
    def category_params
        params.require(:category).permit(:name, :user_id)
    end
end
