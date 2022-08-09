Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  resources :projects
  resources :blogs do 
    member do 
      post :toggle_status
    end
  end

end
