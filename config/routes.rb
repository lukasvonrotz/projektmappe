Rails.application.routes.draw do
  devise_for :users, controllers: { confirmations: 'users/confirmations',
                                    mailer: 'users/mailer',
                                    passwords: 'users/passwords',
                                    registrations: 'users/registrations',
                                    sessions: 'users/sessions',
                                    shared: 'users/shared',
                                    unlocks: 'users/unlocks'}

  get 'home/index'
  root 'home#index'

  resources :users
  resources :projects
  resources :assemblies
  resources :drives
  resources :electrical_installations
  resources :switchgears
  resources :wires
  resources :wiresuppliers


end
