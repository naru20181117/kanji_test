Rails.application.routes.draw do
  root 'years#index'
  resources :kanjis, except: %i[destroy]
  resources :years, only: %i[index show] do
    member do
      get 'pdf'
    end
  end
end
