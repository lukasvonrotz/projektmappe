class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:anzahl_eintraege_assemblies,
                                                              :anzahl_eintraege_customers,
                                                              :anzahl_eintraege_devices,
                                                              :anzahl_eintraege_drives,
                                                              :anzahl_eintraege_elinst,
                                                              :anzahl_eintraege_grobengineerings,
                                                              :anzahl_eintraege_iogroups,
                                                              :anzahl_eintraege_iosignals,
                                                              :anzahl_eintraege_subprojects,
                                                              :anzahl_eintraege_switchgears,
                                                              :anzahl_eintraege_switchgearcombinations,
                                                              :anzahl_eintraege_wires,
                                                              :sortierung_assemblies,
                                                              :sortierung_customers,
                                                              :sortierung_devices,
                                                              :sortierung_drives,
                                                              :sortierung_elinst,
                                                              :sortierung_grobengineerings,
                                                              :sortierung_iogroups,
                                                              :sortierung_iosignals,
                                                              :sortierung_subprojects,
                                                              :sortierung_switchgears,
                                                              :sortierung_switchgearcombinations,
                                                              :sortierung_wires
    ])
  end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
