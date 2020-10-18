# == Route Map
#
#         Prefix Verb   URI Pattern                              Controller#Action
#    tasks_index GET    /tasks/index(.:format)                   tasks#index
#     task_index GET    /task/index(.:format)                    task#index
#           root GET    /                                        static_pages#top
#         signup GET    /signup(.:format)                        users#new
#          login GET    /login(.:format)                         sessions#new
#                POST   /login(.:format)                         sessions#create
#         logout DELETE /logout(.:format)                        sessions#destroy
#     user_tasks GET    /users/:user_id/tasks(.:format)          tasks#index
#                POST   /users/:user_id/tasks(.:format)          tasks#create
#  new_user_task GET    /users/:user_id/tasks/new(.:format)      tasks#new
# edit_user_task GET    /users/:user_id/tasks/:id/edit(.:format) tasks#edit
#      user_task GET    /users/:user_id/tasks/:id(.:format)      tasks#show
#                PATCH  /users/:user_id/tasks/:id(.:format)      tasks#update
#                PUT    /users/:user_id/tasks/:id(.:format)      tasks#update
#                DELETE /users/:user_id/tasks/:id(.:format)      tasks#destroy
#          users GET    /users(.:format)                         users#index
#                POST   /users(.:format)                         users#create
#       new_user GET    /users/new(.:format)                     users#new
#      edit_user GET    /users/:id/edit(.:format)                users#edit
#           user GET    /users/:id(.:format)                     users#show
#                PATCH  /users/:id(.:format)                     users#update
#                PUT    /users/:id(.:format)                     users#update
#                DELETE /users/:id(.:format)                     users#destroy

Rails.application.routes.draw do
  get 'tasks/index'

  get 'task/index'

  root 'static_pages#top'
  get '/signup', to: 'users#new'
  
  get    '/login', to: 'sessions#new'
  post   '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  resources :users do
    resources :tasks
  end
end
