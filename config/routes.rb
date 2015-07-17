Rails.application.routes.draw do

  namespace :api do
    resources :family
  end

end
