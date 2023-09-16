require "application_system_test_case"

class MedicalHistorialsTest < ApplicationSystemTestCase
  setup do
    @medical_historial = medical_historials(:one)
  end

  test "visiting the index" do
    visit medical_historials_url
    assert_selector "h1", text: "Medical historials"
  end

  test "should create medical historial" do
    visit medical_historials_url
    click_on "New medical historial"

    fill_in "Hitorial medico", with: @medical_historial.hitorial_medico
    fill_in "Mascota", with: @medical_historial.mascota_id
    fill_in "Notas", with: @medical_historial.notas
    click_on "Create Medical historial"

    assert_text "Medical historial was successfully created"
    click_on "Back"
  end

  test "should update Medical historial" do
    visit medical_historial_url(@medical_historial)
    click_on "Edit this medical historial", match: :first

    fill_in "Hitorial medico", with: @medical_historial.hitorial_medico
    fill_in "Mascota", with: @medical_historial.mascota_id
    fill_in "Notas", with: @medical_historial.notas
    click_on "Update Medical historial"

    assert_text "Medical historial was successfully updated"
    click_on "Back"
  end

  test "should destroy Medical historial" do
    visit medical_historial_url(@medical_historial)
    click_on "Destroy this medical historial", match: :first

    assert_text "Medical historial was successfully destroyed"
  end
end
