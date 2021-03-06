# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "pages#home"
  resources :plants
  resources :groups do 
    resources :plants
  end
  resources :plants do 
    resources :sensor
  end
end
