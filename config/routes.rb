Rails.application.routes.draw do
  root 'home#index'

  namespace :api do
    resources :family, except: [:edit, :new] do
      resources :child, except: [:index, :show, :edit, :update, :new]
    end
    resources :nanny, except: [:index, :edit, :update, :new]
  end

end
