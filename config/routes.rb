Rails.application.routes.draw do




  # mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  scope '(:locale)', locale: /en/ do
    root to: 'pages#home'
    resources :messages, only: [:new, :create]
    get 'google6464ea87a0b2b52b' => 'pages#google6464ea87a0b2b52b'
    get 'history' => 'pages#history'
    get 'legal' => 'pages#legal'
    get 'quizz' => 'questions#intro'
    get 'questions/initialization' => 'questions#initialization'
    get 'questions/incrementation/:id' => 'questions#incrementation'
    get '/questions/:id' => 'questions#play', as: :questions
    get 'results' => 'quizz_records#new', as: :results
    post 'quizz_records/create' => 'quizz_records#create'
    get 'gallery' => 'pages#gallery'
    get 'gallery/work' => 'pages#work'
    get 'gallery/interiors' => 'pages#interiors'
    get 'gallery/exterior' => 'pages#exterior'
    get 'gallery/SkyViews' => 'pages#sky_views'
    get 'gallery/MedavyByNight' => 'pages#medavy_by_night'
  end
  ActiveAdmin.routes(self)

end
