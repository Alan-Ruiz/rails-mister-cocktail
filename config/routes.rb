Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cocktails, except: [:edit, :update, :destroy] do
    resources :doses, except: [:edit, :update]
  end
  root to: 'cocktails#index'
end
