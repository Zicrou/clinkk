class TypePaimentsController < ApplicationController
  before_action :set_type_paiment, only: [:show, :edit, :update, :destroy]
  access all: [:index, :show, :new, :edit, :create, :update, :destroy], user: :all

  # GET /type_paiments
  def index
    @type_paiments = TypePaiment.all
  end

  # GET /type_paiments/1
  def show
  end

  # GET /type_paiments/new
  def new
    @type_paiment = TypePaiment.new
  end

  # GET /type_paiments/1/edit
  def edit
  end

  # POST /type_paiments
  def create
    @type_paiment = TypePaiment.new(type_paiment_params)

    if @type_paiment.save
      redirect_to @type_paiment, notice: 'Type paiment was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /type_paiments/1
  def update
    if @type_paiment.update(type_paiment_params)
      redirect_to @type_paiment, notice: 'Type paiment was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /type_paiments/1
  def destroy
    @type_paiment.destroy
    redirect_to type_paiments_url, notice: 'Type paiment was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_type_paiment
      @type_paiment = TypePaiment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def type_paiment_params
      params.require(:type_paiment).permit(:name)
    end
end
