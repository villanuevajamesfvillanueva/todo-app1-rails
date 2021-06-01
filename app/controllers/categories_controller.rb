class CategoriesController < ApplicationController
    def index
        @categories = Category.all.order("updated_at DESC")
    end

    def new                        
        @category = Category.new
    end

    
    #for destroying categories, corresponding fk to tasks tables should be deleted
    def show
        @category = Category.find(params[:id])
    end

    def create
        @category = Category.new(category_params)

        if @category.valid?
            @category.save
            redirect_to '/', notice: 'Category was created successfully.'
            
        else
            render :new
        end
    end

    def edit
        @category = Category.find(params[:id])
    end

    def update
        @category = Category.find(params[:id])
        if @category.update(category_params)
            redirect_to '/', notice: 'Category was updated successfully.'
        else
            render :edit
        end
    end

    
    def destroy
        @category = Category.find(params[:id])
        @category.destroy
        redirect_to '/', notice: 'Category was deleted successfully.'
    end
    

    private
    def category_params
        params.require(:category).permit(:name)
    end
end
