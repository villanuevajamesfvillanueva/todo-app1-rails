class HomeController < ApplicationController

    skip_before_action :authenticate_user!, :only => [:index]
    
    def index
        
        @categories = Category.where(user_id: current_user.id).order("updated_at DESC")
        @tasks = current_user.tasks
    
    end
end
