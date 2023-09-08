require "test_helper"

class RegistroMedicosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @registro_medico = registro_medicos(:one)
  end

  test "should get index" do
    get registro_medicos_url
    assert_response :success
  end

  test "should get new" do
    get new_registro_medico_url
    assert_response :success
  end

  test "should create registro_medico" do
    assert_difference("RegistroMedico.count") do
      post registro_medicos_url, params: { registro_medico: { historial_medico: @registro_medico.historial_medico, mascota_id: @registro_medico.mascota_id, notas: @registro_medico.notas } }
    end

    assert_redirected_to registro_medico_url(RegistroMedico.last)
  end

  test "should show registro_medico" do
    get registro_medico_url(@registro_medico)
    assert_response :success
  end

  test "should get edit" do
    get edit_registro_medico_url(@registro_medico)
    assert_response :success
  end

  test "should update registro_medico" do
    patch registro_medico_url(@registro_medico), params: { registro_medico: { historial_medico: @registro_medico.historial_medico, mascota_id: @registro_medico.mascota_id, notas: @registro_medico.notas } }
    assert_redirected_to registro_medico_url(@registro_medico)
  end

  test "should destroy registro_medico" do
    assert_difference("RegistroMedico.count", -1) do
      delete registro_medico_url(@registro_medico)
    end

    assert_redirected_to registro_medicos_url
  end
end
