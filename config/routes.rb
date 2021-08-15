Rails.application.routes.draw do
  root 'kanjis#index'
  resources :kanjis
  resources :years, only: %i[index show] do
    member do
      get 'pdf'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
