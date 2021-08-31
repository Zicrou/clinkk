class CaissesController < ApplicationController
  before_action :set_caiss, only: %i[ show edit update destroy ]

  # GET /caisses or /caisses.json
  def index
    @caisses = Caisse.all
  end

  # GET /caisses/1 or /caisses/1.json
  def show
  end

  # GET /caisses/new
  def new
    @caiss = Caisse.new
  end

  # GET /caisses/1/edit
  def edit
  end

  # POST /caisses or /caisses.json
  def create
    @caiss = Caisse.new(caiss_params)

    respond_to do |format|
      if @caiss.save
        format.html { redirect_to @caiss, notice: "Enregistrement effectué avec succés." }
        format.json { render :show, status: :created, location: @caiss }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @caiss.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /caisses/1 or /caisses/1.json
  def update
    respond_to do |format|
      if @caiss.update(caiss_params)
        format.html { redirect_to @caiss, notice: "Modifié avec succés." }
        format.json { render :show, status: :ok, location: @caiss }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @caiss.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /caisses/1 or /caisses/1.json
  def destroy
    @caiss.destroy
    respond_to do |format|
      format.html { redirect_to caisses_url, notice: "Supprimer avec succés." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_caiss
      @caiss = Caisse.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def caiss_params
      params.require(:caisse).permit(:nom, :prenom, :acte, :payement, :montant, :telephone)
    end
end
