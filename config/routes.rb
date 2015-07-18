Rails.application.routes.draw do

  root 'auctions#index'
  resources :auctions do
  resources :bidits, only: [:create, :destroy]
  # resources :winning_bidits, only: [:create]
  end
  # resources :winning_bidits, only: [] do
  # resources :payments, only: [:new, :create]
  # end
  resources :sessions, only: [:new, :create] do
  delete :destroy, on: :collection
  end
  resources :users, only: [:new, :create, :show]


end
