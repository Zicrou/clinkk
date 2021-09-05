class IpmsController < ApplicationController
  before_action :set_ipm, only: [:show, :edit, :update, :destroy]
  access all: [:index, :show, :new, :edit, :create, :update, :destroy], user: :all

  # GET /ipms
  def index
    @ipms = Ipm.all
  end

  # GET /ipms/1
  def show
  end

  # GET /ipms/new
  def new
    @ipm = Ipm.new
  end

  # GET /ipms/1/edit
  def edit
  end

  # POST /ipms
  def create
    @ipm = Ipm.new(ipm_params)

    if @ipm.save
      redirect_to @ipm, notice: 'Ipm was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /ipms/1
  def update
    if @ipm.update(ipm_params)
      redirect_to @ipm, notice: 'Ipm was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /ipms/1
  def destroy
    @ipm.destroy
    redirect_to ipms_url, notice: 'Ipm was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ipm
      @ipm = Ipm.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def ipm_params
      params.require(:ipm).permit(:name)
    end
end
