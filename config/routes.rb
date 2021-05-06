Rails.application.routes.draw do

  get 'create/destroy'
  root to: 'homes#top'
  get 'home/about' => 'homes#about'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, :only => [:index, :show, :edit, :update]

  resources :books do
    resources :post_comments, :only => [:create, :destroy]
    resource :favorites, :only => [:create, :destroy]
  end

end
