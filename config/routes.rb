Rails.application.routes.draw do

  get 'switches/show'

  root 'static_pages#index'

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }


end
