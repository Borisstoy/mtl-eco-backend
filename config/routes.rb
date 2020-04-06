Rails.application.routes.draw do
  resources :places do
    collection do
      get :search, action: :search
    end 
  end

  get 'places_kinds', to: 'resources#places_kinds'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post 'authenticate', to: 'authentication#authenticate'
end
