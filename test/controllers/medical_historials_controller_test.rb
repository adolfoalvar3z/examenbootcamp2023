require "test_helper"

class MedicalHistorialsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @medical_historial = medical_historials(:one)
  end

  test "should get index" do
    get medical_historials_url
    assert_response :success
  end

  test "should get new" do
    get new_medical_historial_url
    assert_response :success
  end

  test "should create medical_historial" do
    assert_difference("MedicalHistorial.count") do
      post medical_historials_url, params: { medical_historial: { hitorial_medico: @medical_historial.hitorial_medico, mascota_id: @medical_historial.mascota_id, notas: @medical_historial.notas } }
    end

    assert_redirected_to medical_historial_url(MedicalHistorial.last)
  end

  test "should show medical_historial" do
    get medical_historial_url(@medical_historial)
    assert_response :success
  end

  test "should get edit" do
    get edit_medical_historial_url(@medical_historial)
    assert_response :success
  end

  test "should update medical_historial" do
    patch medical_historial_url(@medical_historial), params: { medical_historial: { hitorial_medico: @medical_historial.hitorial_medico, mascota_id: @medical_historial.mascota_id, notas: @medical_historial.notas } }
    assert_redirected_to medical_historial_url(@medical_historial)
  end

  test "should destroy medical_historial" do
    assert_difference("MedicalHistorial.count", -1) do
      delete medical_historial_url(@medical_historial)
    end

    assert_redirected_to medical_historials_url
  end
end
