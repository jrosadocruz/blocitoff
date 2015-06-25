Rails.application.routes.draw do
  get 'tasks/show'

  get 'users/show'

  devise_for :users

  get 'about' => 'welcome#about'

  unauthenticated do
    root to: "welcome#index"
  end

  # AS: generates the route 'authenticated_root_path'
  authenticated do
    root to: 'users#show', as: :authenticated_root
  end

  resources :tasks, only: [:show, :create, :destroy, :update]

end
