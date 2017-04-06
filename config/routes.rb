Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  # mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  scope '(:locale)', locale: /en/ do

    root to: 'pages#home'


    get 'contact' => 'pages#contact'
    get 'history' => 'pages#history'
    get 'gallery' => 'pages#gallery'
    get 'gallery/work' => 'pages#work'
    get 'gallery/interiors' => 'pages#interiors'
    get 'gallery/exterior' => 'pages#exterior'
    get 'gallery/SkyViews' => 'pages#sky_views'
    get 'gallery/MedavyByNight' => 'pages#medavy_by_night'

    get 'quizz' => 'pages#gallery'

    post 'pages/contact/send_contact_message' => 'pages#send_contact_message'

  end

end
