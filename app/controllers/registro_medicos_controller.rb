class RegistroMedicosController < ApplicationController
  before_action :set_registro_medico, only: %i[ show edit update destroy ]

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

  # GET /registro_medicos or /registro_medicos.json
  def index
    @mascota = Mascotum.find(params[:mascotum_id]) # Encuentra la mascota por su ID (en este caso, 16)
    @registro_medicos = @mascota.registro_medicos # Encuentra los registros médicos asociados a la mascota
  end


  # GET /registro_medicos/1 or /registro_medicos/1.json
  def show
  end

  # GET /registro_medicos/new
  def new
    @mascota = Mascotum.find(params[:mascotum_id])
    @registro_medico = RegistroMedico.new
  end

  # GET /registro_medicos/1/edit
  def edit
  end

  # POST /registro_medicos or /registro_medicos.json
  def create
    @registro_medico = RegistroMedico.new(registro_medico_params)

    respond_to do |format|
      if @registro_medico.save
        format.html { redirect_to registro_medico_url(@registro_medico), notice: "Registro medico was successfully created." }
        format.json { render :show, status: :created, location: @registro_medico }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @registro_medico.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /registro_medicos/1 or /registro_medicos/1.json
  def update
    respond_to do |format|
      if @registro_medico.update(registro_medico_params)
        format.html { redirect_to registro_medico_url(@registro_medico), notice: "Registro medico was successfully updated." }
        format.json { render :show, status: :ok, location: @registro_medico }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @registro_medico.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /registro_medicos/1 or /registro_medicos/1.json
  def destroy
    @registro_medico.destroy

    respond_to do |format|
      format.html { redirect_to registro_medicos_url, notice: "Registro medico was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_registro_medico
      @registro_medico = RegistroMedico.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def registro_medico_params
      params.require(:registro_medico).permit(:historial_medico, :notas, :mascota_id)
    end
end
