Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "homepages#index"

  # resources :passengers
  # resources :drivers
  resources :trips, only: [:edit, :update, :show, :destroy]

  resources :passengers do
    resources :trips, only: [:create]
  end

  resources :drivers 

  patch "/driver/:id/make_available", to: "drivers#make_available", as: "make_available"

end
