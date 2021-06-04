class HomeController < ApplicationController

    skip_before_action :authenticate_user!, :only => [:index]
    
    def index
        @tasks = Task.all.order("updated_at DESC")
        @categories = Category.all.order("updated_at DESC")
    end
end
