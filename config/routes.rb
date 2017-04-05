Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  # mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  scope '(:locale)', locale: /en/ do

    root to: 'pages#home'


    get 'contact' => 'pages#contact'
    get 'history' => 'pages#history'
    post 'pages/contact/send_contact_message' => 'pages#send_contact_message'

  end

end
