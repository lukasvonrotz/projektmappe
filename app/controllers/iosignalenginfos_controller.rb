class IosignalenginfosController < ApplicationController
  # Auflistung aller Iosignalenginfos PRO Version
  # GET /projects/:project_id/subprojects/:subproject_id/subsubprojects/:subsubprojects_id/iosignalenginfos
  def index
    @subsubproject = Subsubproject.find(params[:subsubproject_id])
    @subproject = @subsubproject.subproject
    @project = @subproject.project

    @iosignals = []
    @iosignalenginfos = []
    Grobengineering.where(:subsubproject_id => @subsubproject.id).each do |grobengineering|
      grobengineering.iosignals.each do |iosignal|
        @iosignals << iosignal
        iosignal.iosignalenginfos.each do |iosignalenginfo|
          @iosignalenginfos << iosignalenginfo
        end
      end
    end
  end

  # Save an updated iosignalenginfo
  # PUT /projects/:project_id/subprojects/:subproject_id/subsubprojects/:subsubprojects_id/iosignalenginfos/:id
  def update
    @iosignalenginfo = Iosignalenginfo.find(params[:id])
    @iosignal = Iosignal.find(@iosignalenginfo.iosignal_id)
    @grobengineering = Grobengineering.find(@iosignal.grobengineering_id)
    subsubproject = @grobengineering.subsubproject
    subproject = subsubproject.subproject
    project = subproject.project

    # checken ob wer? feld eingetragen. nur dann datum abspeichern!
    if @iosignalenginfo.update(iosignalenginfo_params)
      if (params[:iosignalenginfo][:pendenz_wer].to_s == '')
        @iosignalenginfo.update_column(:pendenz_datum, nil)
      end
      if (params[:iosignalenginfo][:pendenz_antwort_wer].to_s == '')
        @iosignalenginfo.update_column(:pendenz_antwort_datum, nil)
      end
      if (params[:iosignalenginfo][:frage_wer].to_s == '')
        @iosignalenginfo.update_column(:frage_datum, nil)
      end
      if (params[:iosignalenginfo][:frage_antwort_wer].to_s == '')
        @iosignalenginfo.update_column(:frage_antwort_datum, nil)
      end
      if (params[:iosignalenginfo][:sw_instruction_wer].to_s == '')
        @iosignalenginfo.update_column(:sw_instruction_datum, nil)
      end
      if (params[:iosignalenginfo][:sw_instruction_antwort_wer].to_s == '')
        @iosignalenginfo.update_column(:sw_instruction_antwort_datum, nil)
      end
      redirect_to project_subproject_subsubproject_iosignalenginfos_path(:project_id => project.id,
                               :subproject_id => subproject.id,
                               :subsubproject_id => subsubproject.id), :notice => 'Eng-Infos erfolgreich aktualisiert.'
    else
      render 'edit'
    end
  end

  private
  # defines which parameters have to be provided by the form when creating a new iosignalenginfo
  def iosignalenginfo_params
    params.require(:iosignalenginfo).permit!
  end
end
