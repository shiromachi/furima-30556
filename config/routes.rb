Rails.application.routes.draw do
  root to: 'items#index'
  devise_for :users
  resources :items do
    resources :managements, only: [:index, :create] do
    end
  end
end
