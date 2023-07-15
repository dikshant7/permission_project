Rails.application.routes.draw do
  resources :table
  # get 'home/index'
  root "table#index"
  get '/submit_form', to: 'table#submit_form', as: 'submit_form'
  post '/submit_form', to: 'table#submit_form'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
