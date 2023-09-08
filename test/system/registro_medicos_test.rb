require "application_system_test_case"

class RegistroMedicosTest < ApplicationSystemTestCase
  setup do
    @registro_medico = registro_medicos(:one)
  end

  test "visiting the index" do
    visit registro_medicos_url
    assert_selector "h1", text: "Registro medicos"
  end

  test "should create registro medico" do
    visit registro_medicos_url
    click_on "New registro medico"

    fill_in "Historial medico", with: @registro_medico.historial_medico
    fill_in "Mascota", with: @registro_medico.mascota_id
    fill_in "Notas", with: @registro_medico.notas
    click_on "Create Registro medico"

    assert_text "Registro medico was successfully created"
    click_on "Back"
  end

  test "should update Registro medico" do
    visit registro_medico_url(@registro_medico)
    click_on "Edit this registro medico", match: :first

    fill_in "Historial medico", with: @registro_medico.historial_medico
    fill_in "Mascota", with: @registro_medico.mascota_id
    fill_in "Notas", with: @registro_medico.notas
    click_on "Update Registro medico"

    assert_text "Registro medico was successfully updated"
    click_on "Back"
  end

  test "should destroy Registro medico" do
    visit registro_medico_url(@registro_medico)
    click_on "Destroy this registro medico", match: :first

    assert_text "Registro medico was successfully destroyed"
  end
end
