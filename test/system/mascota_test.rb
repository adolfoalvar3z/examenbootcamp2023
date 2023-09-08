require "application_system_test_case"

class MascotaTest < ApplicationSystemTestCase
  setup do
    @mascotum = mascota(:one)
  end

  test "visiting the index" do
    visit mascota_url
    assert_selector "h1", text: "Mascota"
  end

  test "should create mascotum" do
    visit mascota_url
    click_on "New mascotum"

    fill_in "Cliente", with: @mascotum.cliente_id
    fill_in "Especie", with: @mascotum.especie
    fill_in "Fecha nacimiento", with: @mascotum.fecha_nacimiento
    fill_in "Nombre", with: @mascotum.nombre
    fill_in "Raza", with: @mascotum.raza
    click_on "Create Mascotum"

    assert_text "Mascotum was successfully created"
    click_on "Back"
  end

  test "should update Mascotum" do
    visit mascotum_url(@mascotum)
    click_on "Edit this mascotum", match: :first

    fill_in "Cliente", with: @mascotum.cliente_id
    fill_in "Especie", with: @mascotum.especie
    fill_in "Fecha nacimiento", with: @mascotum.fecha_nacimiento
    fill_in "Nombre", with: @mascotum.nombre
    fill_in "Raza", with: @mascotum.raza
    click_on "Update Mascotum"

    assert_text "Mascotum was successfully updated"
    click_on "Back"
  end

  test "should destroy Mascotum" do
    visit mascotum_url(@mascotum)
    click_on "Destroy this mascotum", match: :first

    assert_text "Mascotum was successfully destroyed"
  end
end
