Rails.application.routes.draw do
    devise_for :users

    devise_scope :user do
        authenticated :user do
            root 'home#index', as: :authenticated_root
        end

        unauthenticated do
            root 'devise/sessions#new', as: :unauthenticated_root
        end
    end
  
    root 'home#index'

    patch 'tasks/update_status/:id', to: 'tasks#update_status', as: 'update_status' 
    get 'tasks/tasks_list', to: 'tasks#tasks_list', as: 'tasks_list' 
    resources :tasks
    resources :categories
end
