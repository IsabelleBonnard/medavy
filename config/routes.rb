Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  # mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  scope '(:locale)', locale: /en/ do

    root to: 'pages#home'


    get 'contact' => 'pages#contact'
    get 'history' => 'pages#history'
    get 'gallery' => 'pages#gallery'
    get 'quizz' => 'pages#gallery'

    post 'pages/contact/send_contact_message' => 'pages#send_contact_message'

  end

end
