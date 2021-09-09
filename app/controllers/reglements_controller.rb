class ReglementsController < ApplicationController
  before_action :set_reglement, only: [:show, :edit, :update, :destroy]
  access all: [:index, :show, :new, :edit, :create, :update, :destroy], user: :all

  # GET /reglements
  def index
    @reglements = Reglement.all
  end

  # GET /reglements/1
  def show
  end

  # GET /reglements/new
  def new
    @reglement = Reglement.new
  end

  # GET /reglements/1/edit
  def edit
  end

  # POST /reglements
  def create
    @reglement = Reglement.new(reglement_params)

    if @reglement.save
      #@r = Comptabilite.where(ipm_id: Reglement.ipm_id)
      #pry
      redirect_to @reglement, notice: 'Reglement was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /reglements/1
  def update
    if @reglement.update(reglement_params)
      redirect_to @reglement, notice: 'Reglement was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /reglements/1
  def destroy
    @reglement.destroy
    redirect_to reglements_url, notice: 'Reglement was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reglement
      @reglement = Reglement.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def reglement_params
      params.require(:reglement).permit(:mois, :montant, :ipm_id)
    end
end
