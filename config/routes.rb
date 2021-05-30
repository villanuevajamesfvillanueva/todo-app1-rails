Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'tasks#index'

  put '/tasks/:id/edit', to: 'tasks#update', as: 'tasks_update'
  post '/tasks' => 'tasks#create', as: 'task_create'
  resources :tasks
end
