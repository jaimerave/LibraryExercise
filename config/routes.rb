Rails.application.routes.draw do
  resources :users
  resources :items do
    member do
      post :borrow
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
