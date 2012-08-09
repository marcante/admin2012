Celestin::Application.routes.draw do
  devise_for :users#, :path_prefix => 'devise'
  resources :users

  root :to => "dashboard#index"
end
