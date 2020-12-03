Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  get 'users/:id', to: 'users#show', as: :user_profile
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :posts do
    resources :feedbacks, only: [:create, :edit, :update, :show]
  end


end
