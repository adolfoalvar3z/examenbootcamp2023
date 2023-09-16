class MedicalHistorialsController < ApplicationController
  before_action :set_medical_historial, only: %i[ show edit update destroy ]

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

  # GET /medical_historials or /medical_historials.json
  def index
    @mascota = Mascotum.find(params[:mascotum_id])
    @medical_historials = @mascota.medical_historials
  end



  # GET /medical_historials/1 or /medical_historials/1.json
  def show
  end

  # GET /medical_historials/new
  def new
    @medical_historial = MedicalHistorial.new
  end

  # GET /medical_historials/1/edit
  def edit
  end

  # POST /medical_historials or /medical_historials.json
  def create
    @medical_historial = MedicalHistorial.new(medical_historial_params)

    respond_to do |format|
      if @medical_historial.save
        format.html { redirect_to medical_historial_url(@medical_historial), notice: "Medical historial was successfully created." }
        format.json { render :show, status: :created, location: @medical_historial }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @medical_historial.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /medical_historials/1 or /medical_historials/1.json
  def update
    respond_to do |format|
      if @medical_historial.update(medical_historial_params)
        format.html { redirect_to medical_historial_url(@medical_historial), notice: "Medical historial was successfully updated." }
        format.json { render :show, status: :ok, location: @medical_historial }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @medical_historial.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /medical_historials/1 or /medical_historials/1.json
  def destroy
    @medical_historial.destroy

    respond_to do |format|
      format.html { redirect_to medical_historials_url, notice: "Medical historial was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_medical_historial
      @medical_historial = MedicalHistorial.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def medical_historial_params
      params.require(:medical_historial).permit(:hitorial_medico, :notas, :mascota_id)
    end
end
