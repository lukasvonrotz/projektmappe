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
      resources :infos
      resources :histories
      resources :subsubprojects do
        resources :grobengineerings do
          collection { post :import}
        end
        resources :offertpositions
      end
    end
  end
  resources :grobengineerings
  resources :offertpositions
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

  resources :suppliers do
    resources :wire_suppliers
  end
  resources :suppliertypes
  resources :wirecaptionprices

  match "/projects/:project_id/subprojects/:subproject_id/copy/:versiontocopy",
        to: "subprojects#copy", as: :copy, via: [:get]
  match "/projects/:project_id/subprojects/:subproject_id/subsubprojects/:subsubproject_id/offerte",
        to: "grobengineerings#offerte", as: :offerte, via: [:get]
  match "/projects/:project_id/subprojects/:subproject_id/subsubprojects/:subsubproject_id/grobengineering/delete_all",
        to: "grobengineerings#delete_all", as: :delete_all, via: [:get]

end
