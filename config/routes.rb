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
  resources :projects do
    resources :subsystems do
      resources :units
    end
    resources :subprojects do
      resources :subsubprojects
    end
  end
  resources :subsystems
  resources :units
  resources :subprojects
  resources :subsubprojects
  resources :assemblies
  resources :drives
  resources :electrical_installations
  resources :switchgears
  resources :switchgearcombinations
  resources :switchgearconnections
  resources :wires
  resources :devices
  resources :customers
  resources :iogroups
  resources :iotypes
  resources :grobengineerings

  resources :suppliers do
    resources :wire_suppliers
  end
  resources :wirecaptionprices

end
