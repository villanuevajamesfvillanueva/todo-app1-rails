class HomeController < ApplicationController

    skip_before_action :authenticate_user!, :only => [:index]
    
    def index
        @tasks = Task.all.order("updated_at DESC")
        #consult ma'am which is better:
        #1. add another user_id column in tasks table, then use .where 
        #2. define @tasks without adding new column in tasks table
        # @categories = Category.where(user_id: current_user.id).order("updated_at DESC")
            #^this doesn't work when signed out since current_user = nil;
            #need to change root path; it should be the sign up page
        @categories = Category.order("updated_at DESC")
    end
end
