Rails.application.routes.draw do

  root to: 'pages#home'
  get 'contact', to: 'pages#contact'
  get 'works', to: 'pages#works'
  get 'history', to: 'pages#history'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
