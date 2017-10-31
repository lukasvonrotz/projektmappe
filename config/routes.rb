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
          resources :iosignals do
            resources :iosignalenginfos
            resources :iosignalibninfos
          end
        end
        resources :offertpositions
        resources :offers
        resources :iosignals do
          resources :iosignalenginfos
          resources :iosignalibninfos
        end
        resources :iosignalenginfos
        resources :iosignalibninfos
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
    resources :iogroupcomponents do
      resources :iochannels
    end
  end
  resources :iotypes do
    collection { post :import}
  end

  resources :suppliers do
    collection { post :import}
    resources :wire_suppliers
    resources :electrical_installation_suppliers
    resources :drive_suppliers
    resources :switchgear_suppliers
  end
  resources :wire_suppliers do
    collection { post :import}
  end
  resources :electrical_installation_suppliers do
    collection { post :import}
  end
  resources :drive_suppliers do
    collection { post :import}
  end
  resources :switchgear_suppliers do
    collection { post :import}
  end
  resources :suppliertypes do
    collection { post :import}
  end
  resources :wirecaptionprices
  resources :iogroupcomponents

  resources :iochannels
  resources :iosignals do
    resources :iosignalenginfos
    resources :iosignalibninfos
  end
  resources :iosignalenginfos
  resources :iosignalibninfos



  match "/projects/:project_id/subprojects/:subproject_id/copy/:versiontocopy",
        to: "subprojects#copy", as: :copy, via: [:get]
  match "/projects/:project_id/subprojects/:subproject_id/subsubprojects/:subsubproject_id/offerte",
        to: "grobengineerings#offerte", as: :offerte, via: [:get]
  match "/projects/:project_id/subprojects/:subproject_id/subsubprojects/:subsubproject_id/grobengineering/delete_all",
        to: "grobengineerings#delete_all", as: :delete_all, via: [:get]

  match "/projects/:project_id/subprojects/:subproject_id/subsubprojects/:subsubproject_id/offers/:offer_id/csvexport",
        to: "offers#csvexport", as: :csvexport, via: [:get]

  match "/settings", to: "settings#index", as: :settings, via: [:get]
  match "/settings/csvexport_all_tables/:subsubproject_id", to: "settings#csvexport_all_tables", as: :csvexport_all_tables, via: [:get]

  # generate / destroy channels per iogroup / iogroupcomponent
  match "/iogroups/:iogroup_id/generate_iogroup_channels",
        to: "iogroups#generate_iogroup_channels", as: :generate_iogroup_channels, via: [:get]
  match "/iogroups/:iogroup_id/delete_free_iogroup_channels",
        to: "iogroups#delete_free_iogroup_channels", as: :delete_free_iogroup_channels, via: [:get]
  match "/iogroups/:iogroup_id/iogroupcomponents/:iogroupcomponent_id/generate_channels",
        to: "iogroupcomponents#generate_channels", as: :generate_channels, via: [:get]
  match "/iogroups/:iogroup_id/iogroupcomponents/:iogroupcomponent_id/delete_free_channels",
        to: "iogroupcomponents#delete_free_channels", as: :delete_free_channels, via: [:get]

  match "/projects/:project_id/subprojects/:subproject_id/subsubprojects/:subsubproject_id/generate_signals",
        to: "subsubprojects#generate_signals", as: :generate_signals, via: [:get]

  match "/projects/:project_id/subprojects/:subproject_id/subsubprojects/:subsubproject_id/delete_signals",
        to: "subsubprojects#delete_signals", as: :delete_signals, via: [:get]

  match "/projects/:project_id/subprojects/:subproject_id/subsubprojects/:subsubproject_id/grobengineering_extended",
        to: "grobengineerings#grobengineering_extended", as: :grobengineering_extended, via: [:get]
end
