class IosignalibninfosController < ApplicationController
  # Auflistung aller Iosignalenginfos PRO Version
  # GET /projects/:project_id/subprojects/:subproject_id/subsubprojects/:subsubprojects_id/iosignalibninfos
  def index
    @subsubproject = Subsubproject.find(params[:subsubproject_id])
    @subproject = @subsubproject.subproject
    @project = @subproject.project

    @iosignals = []
    @iosignalibninfos = []
    Grobengineering.where(:subsubproject_id => @subsubproject.id).each do |grobengineering|
      grobengineering.iosignals.each do |iosignal|
        @iosignals << iosignal
        iosignal.iosignalibninfos.each do |iosignalibninfo|
          @iosignalibninfos << iosignalibninfo
        end
      end
    end
  end

  # Save an updated iosignalibninfo
  # PUT /projects/:project_id/subprojects/:subproject_id/subsubprojects/:subsubprojects_id/iosignalibninfos/:id
  def update
    @iosignalibninfo = Iosignalibninfo.find(params[:id])
    @iosignal = Iosignal.find(@iosignalibninfo.iosignal_id)
    @grobengineering = Grobengineering.find(@iosignal.grobengineering_id)
    subsubproject = @grobengineering.subsubproject
    subproject = subsubproject.subproject
    project = subproject.project

    # checken ob wer? feld eingetragen. nur dann datum abspeichern!
    if @iosignalibninfo.update(iosignalibninfo_params)
      if (params[:iosignalibninfo][:signaltest_ok_wer].to_s == '')
        @iosignalibninfo.update_column(:signaltest_ok_datum, nil)
      end

      redirect_to project_subproject_subsubproject_iosignalibninfos_path(:project_id => project.id,
                                                                         :subproject_id => subproject.id,
                                                                         :subsubproject_id => subsubproject.id), :notice => 'IBN-Infos erfolgreich aktualisiert.'
    else
      render 'edit'
    end
  end

  private
  # defines which parameters have to be provided by the form when creating a new iosignalibninfo
  def iosignalibninfo_params
    params.require(:iosignalibninfo).permit!
  end
end
