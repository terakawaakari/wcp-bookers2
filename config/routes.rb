Rails.application.routes.draw do

  root to: 'homes#top'
  get 'homes/about' => 'homes#about'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, :only => [:index, :show, :edit, :update]

  resources :books

end
