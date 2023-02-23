Rails.application.routes.draw do
  resources :movies, only: %i[index show]
  resources :lists, only: %i[index show new create]
  resources :bookmars, only: %i[new create destroy]
end
