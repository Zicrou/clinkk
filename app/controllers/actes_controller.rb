class ActesController < ApplicationController
  before_action :set_acte, only: [:show, :edit, :update, :destroy]
  access all: [:index, :show, :new, :edit, :create, :update, :destroy], user: :all

  # GET /actes
  def index
    @actes = Acte.all
  end

  # GET /actes/1
  def show
  end

  # GET /actes/new
  def new
    @acte = Acte.new
  end

  # GET /actes/1/edit
  def edit
  end

  # POST /actes
  def create
    @acte = Acte.new(acte_params)

    if @acte.save
      redirect_to @acte, notice: 'Acte was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /actes/1
  def update
    if @acte.update(acte_params)
      redirect_to @acte, notice: 'Acte was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /actes/1
  def destroy
    @acte.destroy
    redirect_to actes_url, notice: 'Acte was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_acte
      @acte = Acte.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def acte_params
      params.require(:acte).permit(:name)
    end
end
