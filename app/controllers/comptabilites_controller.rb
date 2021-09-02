class ComptabilitesController < ApplicationController
  before_action :set_comptabilite, only: %i[ show edit update destroy ]

  # GET /comptabilites or /comptabilites.json
  def index
    @comptabilites = Comptabilite.all
    
    @caiss_journalier = Comptabilite.bilan_journalier(Date.today)
    
    @date = params[:selected_date]
    @date_convert = @date.to_date if @date
    @recherche_caiss_journalier = Comptabilite.recherche_caiss_journalier(@date_convert)
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
      params.require(:comptabilite).permit(:nom, :prenom, :acte, :payment, :montant, :telephone, :selected_date)
    end

    #def set_recherch_comptabilite_params
    #  select_date = params[:selected_date] if !params[:selected_date]#.nil?
    #end
end
