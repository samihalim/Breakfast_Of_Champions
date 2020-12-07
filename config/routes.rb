Rails.application.routes.draw do
  get 'upvote/create'
  get 'upvote/destroy'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  get 'users/:id', to: 'users#show', as: :user_profile
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :posts do
    resources :feedbacks, only: [:create, :edit, :update, :show]
  end

  authenticate :user, ->(user) { user.admin? } do
  mount Blazer::Engine, at: "blazer"
  end
end
