class CitaController < ApplicationController
  before_action :set_citum, only: %i[ show edit update destroy ]

    #usuario normal
    before_action only: [:index, :show] do
      authorize_request(["vet", "admin"])
    end
    #usuario veterinario
    before_action only: [:new, :edit, :create, :update] do
      authorize_request(["vet", "admin"])
    end
  #usuario admin
    before_action only: [:destroy] do
      authorize_request(["admin"])
    end

  # GET /cita or /cita.json
  def index
    @pagy, @cita = pagy(Citum.all)
  end

  # GET /cita/1 or /cita/1.json
  def show
  end

  # GET /cita/new
  def new
    @citum = Citum.new
    @mascotas = Mascotum.all
    @veterinarios = Veterinario.all
  end

  # GET /cita/1/edit
  def edit
    @mascotas = Mascotum.all
    @veterinarios = Veterinario.all
  end

  # POST /cita or /cita.json
  def create
    @citum = Citum.new(citum_params)

    respond_to do |format|
      if @citum.save
        format.html { redirect_to citum_url(@citum), notice: "Citum was successfully created." }
        format.json { render :show, status: :created, location: @citum }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @citum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cita/1 or /cita/1.json
  def update
    respond_to do |format|
      if @citum.update(citum_params)
        format.html { redirect_to citum_url(@citum), notice: "Citum was successfully updated." }
        format.json { render :show, status: :ok, location: @citum }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @citum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cita/1 or /cita/1.json
  def destroy
    @citum.destroy

    respond_to do |format|
      format.html { redirect_to cita_url, notice: "Citum was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_citum
      @citum = Citum.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def citum_params
      params.require(:citum).permit(:fecha, :hora, :duracion, :veterinario_id, :mascota_id, :estado)
    end
end
