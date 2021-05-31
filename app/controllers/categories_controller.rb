class CategoriesController < ApplicationController
    def index
        @categories = Category.all.order("updated_at DESC")
    end

    def new                        
        @category = Category.new
    end
end
