class HomeController < ApplicationController
    def index
        @tasks = Task.all.order("updated_at DESC")
        @categories = Category.all.order("updated_at DESC")
    end
end
