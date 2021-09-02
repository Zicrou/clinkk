class ComptabilitesController < ApplicationController
  before_action :set_comptabilite, only: %i[ show edit update destroy ]

  # GET /comptabilites or /comptabilites.json
  def index
    @date_day = params[:selected_date_day]
    @date_month = params[:selected_date_month]
    @comptabilites = Comptabilite.all
    
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
      if @comptabilite.save
        format.html { redirect_to @comptabilite, notice: "Comptabilite was successfully created." }
        format.json { render :show, status: :created, location: @comptabilite }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @comptabilite.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comptabilites/1 or /comptabilites/1.json
  def update
    respond_to do |format|
      if @comptabilite.update(comptabilite_params)
        format.html { redirect_to @comptabilite, notice: "Comptabilite was successfully updated." }
        format.json { render :show, status: :ok, location: @comptabilite }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @comptabilite.errors, status: :unprocessable_entity }
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
      params.require(:comptabilite).permit(:nom, :prenom, :acte, :payment, :montant, :telephone, :selected_date_day, :selected_date_month)
    end

    #def set_recherch_comptabilite_params
    #  select_date = params[:selected_date] if !params[:selected_date]#.nil?
    #end
end
