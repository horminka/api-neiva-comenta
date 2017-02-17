Rails.application.routes.draw do
  root 'inicio#index'

  resources :posts,
    only: [:create],
    defaults: { format: :json }

  resources :topics,
    only: [:create, :show],
    defaults: { format: :json }

  resources :boards,
    only: [:index, :show],
    defaults: { format: :json }
end
