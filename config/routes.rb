Rails.application.routes.draw do
  devise_for :users, controllers: { confirmations: 'users/confirmations',
                                    mailer: 'users/mailer',
                                    passwords: 'users/passwords',
                                    registrations: 'users/registrations',
                                    sessions: 'users/sessions',
                                    shared: 'users/shared',
                                    unlocks: 'users/unlocks'}

  get 'home/index'
  root 'projects#index'

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
        resources :offers
      end
    end
  end
  resources :grobengineerings
  resources :offertpositions
  resources :infos
  resources :histories
  resources :offers do
    resources :offer_offertpositions
  end
  resources :offer_offertpositions
  resources :subsystems
  resources :units
  resources :subprojects
  resources :subsubprojects
  resources :assemblies do
    collection { post :import}
  end
  resources :drives do
    collection { post :import}
  end
  resources :electrical_installations do
    collection { post :import}
  end
  resources :switchgears do
    collection { post :import}
  end
  resources :switchgearcombinations do
    collection { post :import}
  end
  resources :switchgearconnections do
    collection { post :import}
  end
  resources :wires do
    collection { post :import}
  end
  resources :devices do
    collection { post :import}
  end
  resources :customers do
    collection { post :import}
  end
  resources :iogroups do
    collection { post :import}
  end
  resources :iotypes do
    collection { post :import}
  end

  resources :suppliers do
    collection { post :import}
    resources :wire_suppliers
  end
  resources :wire_suppliers do
    collection { post :import}
  end
  resources :suppliertypes
  resources :wirecaptionprices

  match "/projects/:project_id/subprojects/:subproject_id/copy/:versiontocopy",
        to: "subprojects#copy", as: :copy, via: [:get]
  match "/projects/:project_id/subprojects/:subproject_id/subsubprojects/:subsubproject_id/offerte",
        to: "grobengineerings#offerte", as: :offerte, via: [:get]
  match "/projects/:project_id/subprojects/:subproject_id/subsubprojects/:subsubproject_id/grobengineering/delete_all",
        to: "grobengineerings#delete_all", as: :delete_all, via: [:get]

  match "/projects/:project_id/subprojects/:subproject_id/subsubprojects/:subsubproject_id/offers/:offer_id/csvexport",
        to: "offers#csvexport", as: :csvexport, via: [:get]

end
