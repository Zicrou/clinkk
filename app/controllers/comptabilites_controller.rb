class ComptabilitesController < ApplicationController
  before_action :set_comptabilite, only: %i[ show edit update destroy ]

  access user: {except: [:index, :edit, :show, :update, :create, :new, :destroy]}, editor:[:new, :create, :update, :edit, :show, {except: [:index, :destroy]}], directeur:[:new, :create, :update, :edit, :show, {except: [:index, :destroy]}], admin: :all
  # GET /comptabilites or /comptabilites.json
  def index
    if !logged_in?(:admin, :directeur)
      redirect_to root_path(), notice: "Vous n'êtes pas autorisé à acceder à cette page"
    else
      @date_day = params[:selected_date_day]
      @date_month = params[:selected_date_month]
      @comptabilites = Comptabilite.all.recent
      
      @caiss_journalier = Comptabilite.bilan_journalier(Date.today)
      
      if @date_month && !@date_month.empty?
        @date_convert = @date_month.to_date
        @bilan_mensuel = Comptabilite.bilan_mensuel(@date_convert)
        @date_month_info = @date_month.to_datetime
        #@date_month_info.strftime("%Y %m")
      end

      if @date_day && !@date_day.empty?
        @date_convert = @date_day.to_date
        @recherche_caiss_journalier = Comptabilite.recherche_caiss_journalier(@date_convert)
      end
    end
    
  end

  # GET /comptabilites/1 or /comptabilites/1.json
  def show
  end

  # GET /comptabilites/new
  def new
    @comptabilite = Comptabilite.new

  end

  # GET /comptabilites/1/edit
  def edit
  end

  # POST /comptabilites or /comptabilites.json
  def create
    @comptabilite = Comptabilite.new(comptabilite_params)

    respond_to do |format|
      if @comptabilite.type_paiment_id == 1
        if (@comptabilite.pourcentage_ipm!= "" || @comptabilite.ipm_id != "" || @comptabilite.montant_total != "" || @comptabilite.montant < 0)
          format.html { render :new}         
          @msg_error = "ECHEC D'ENREGISTREMENT. VOUS AVEZ CHOISI CASH COMME TYPE DE PAIMENT DONC VIDER LE LISTE IPM AINSI QUE LE POURCENTAGE DE L'IPM."
        else
          if @comptabilite.save
            format.html { redirect_to @comptabilite, notice: "Enregistrer avec succés." }
            format.json { render :show, status: :created, location: @comptabilite }
          else
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @comptabilite.errors, status: :unprocessable_entity }
          end
        end 
      elsif @comptabilite.type_paiment_id == 2
        if (@comptabilite.pourcentage_ipm == "" || @comptabilite.pourcentage_ipm < 0 || @comptabilite.ipm_id == "" || @comptabilite.montant == "" || @comptabilite.montant < 0 || @comptabilite.montant_total <= 0 || @comptabilite.montant_total == "" )
          format.html { render :new}         
          @msg_error = "ECHEC D'ENREGISTREMENT. VOUS AVEZ CHOISI IPM COMME TYPE DE PAIMENT DONC VEUILLEZ SELECTIONNER DANS LA LISTE DES IPM ET SAISIR LE POURCENTAGE DE PRISE EN CHARGE.LE MONTANT DOIT PAS ÊTRE INFÉRIEUR À 0"
        elsif (@comptabilite.pourcentage_ipm == 100 && @comptabilite.montant != 0)
          format.html { render :new}         
          @msg_error = "ECHEC D'ENREGISTREMENT.  LE POURCENTAGE DE PRISE EN CHARGE ET LE MONTANT SAISI NE CORRESPONDENT PAS."
        elsif (@comptabilite.pourcentage_ipm < 100 && @comptabilite.montant <= 0)
          format.html { render :new}         
          @msg_error = "ECHEC D'ENREGISTREMENT.  LE POURCENTAGE DE PRISE EN CHARGE ET LE MONTANT SAISI NE CORRESPONDENT PAS."
        elsif (@comptabilite.pourcentage_ipm == 0 && @comptabilite.montant == 0)
          format.html { render :new}         
          @msg_error = "ECHEC D'ENREGISTREMENT.  LE POURCENTAGE DE PRISE EN CHARGE ET LE MONTANT SAISI NE CORRESPONDENT PAS."
        else
          if @comptabilite.save
            format.html { redirect_to @comptabilite, notice: "Enregistrer avec succés." }
            format.json { render :show, status: :created, location: @comptabilite }
          else
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @comptabilite.errors, status: :unprocessable_entity }
          end
        end
      end
    end
  end

  # PATCH/PUT /comptabilites/1 or /comptabilites/1.json
  def update
    type_paiment = params[:comptabilite][:type_paiment_id]
    param_type_paiment = params[:comptabilite][:type_paiment_id].to_i

    pourcentage_ipm = params[:comptabilite][:pourcentage_ipm]
    param_pourcentage_ipm = params[:comptabilite][:pourcentage_ipm].to_i

    ipm_id = params[:comptabilite][:ipm_id]
    param_ipm_id = params[:comptabilite][:ipm_id].to_i

    montant = params[:comptabilite][:montant]
    param_montant = params[:comptabilite][:montant].to_i

    montant_total = params[:comptabilite][:montant_total]
    param_montant_total = params[:comptabilite][:montant_total].to_i

    respond_to do |format|
      if type_paiment == "1"
        if (pourcentage_ipm != "" || ipm_id != "" || montant_total != "" || param_montant <= 0)
          format.html { render :edit}         
          @msg_error = "ECHEC D'ENREGISTREMENT. VOUS AVEZ CHOISI CASH COMME TYPE DE PAIMENT DONC VIDER LE LISTE IPM AINSI QUE LE POURCENTAGE DE L'IPM." 
        else
          if @comptabilite.update(comptabilite_params)
            format.html { redirect_to @comptabilite, notice: "Modifier avec succés." }
            format.json { render :show, status: :ok, location: @comptabilite }
          else
            format.html { render :edit, status: :unprocessable_entity }
            format.json { render json: @comptabilite.errors, status: :unprocessable_entity }
          end
        end
      elsif type_paiment == "2"
        if (pourcentage_ipm == "" || ipm_id == "" || montant == "" || param_montant < 0 || montant_total == "" || param_montant_total <= 0)
          format.html { render :edit}         
          @msg_error = "ECHEC D'ENREGISTREMENT. VOUS AVEZ CHOISI IPM COMME TYPE DE PAIMENT DONC VEUILLEZ SELECTIONNER DANS LA LISTE DES IPM ET SAISIR LE POURCENTAGE DE PRISE EN CHARGE.LE MONTANT DOIT PAS ÊTRE INFÉRIEUR À 0"
        elsif (param_pourcentage_ipm < 100 && (param_montant <= 0 || montant == ""))
          format.html { render :edit}         
          @msg_error = "ECHEC D'ENREGISTREMENT.  LE POURCENTAGE DE PRISE EN CHARGE NE CORRESPOND PAS AVEC LE MONTANT SAISI."
        elsif (param_pourcentage_ipm == 100 && (param_montant > 0 || param_montant < 0 ))
          format.html { render :edit}         
          @msg_error = "ECHEC D'ENREGISTREMENT.  LE POURCENTAGE DE PRISE EN CHARGE ET LE MONTANT SAISI NE CORRESPONDENT PAS."
        else
          if @comptabilite.update(comptabilite_params)
            format.html { redirect_to @comptabilite, notice: "Modifier avec succés." }
            format.json { render :show, status: :ok, location: @comptabilite }
          else
            format.html { render :edit, status: :unprocessable_entity }
            format.json { render json: @comptabilite.errors, status: :unprocessable_entity }
          end
        end
      end
    end
  end

  # DELETE /comptabilites/1 or /comptabilites/1.json
  def destroy
    @comptabilite.destroy
    respond_to do |format|
      format.html { redirect_to comptabilites_url, notice: "Comptabilite was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comptabilite
      @comptabilite = Comptabilite.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comptabilite_params
      params.require(:comptabilite).permit(:nom, :prenom, :acte_id, :montant, :montant_total, :telephone, :selected_date_day, :selected_date_month, :ipm_id, :type_paiment_id, :pourcentage_ipm)
    end

    #def set_recherch_comptabilite_params
    #  select_date = params[:selected_date] if !params[:selected_date]#.nil?
    #end
end
