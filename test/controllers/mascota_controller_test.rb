require "test_helper"

class MascotaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mascotum = mascota(:one)
  end

  test "should get index" do
    get mascota_url
    assert_response :success
  end

  test "should get new" do
    get new_mascotum_url
    assert_response :success
  end

  test "should create mascotum" do
    assert_difference("Mascotum.count") do
      post mascota_url, params: { mascotum: { cliente_id: @mascotum.cliente_id, especie: @mascotum.especie, fecha_nacimiento: @mascotum.fecha_nacimiento, nombre: @mascotum.nombre, raza: @mascotum.raza } }
    end

    assert_redirected_to mascotum_url(Mascotum.last)
  end

  test "should show mascotum" do
    get mascotum_url(@mascotum)
    assert_response :success
  end

  test "should get edit" do
    get edit_mascotum_url(@mascotum)
    assert_response :success
  end

  test "should update mascotum" do
    patch mascotum_url(@mascotum), params: { mascotum: { cliente_id: @mascotum.cliente_id, especie: @mascotum.especie, fecha_nacimiento: @mascotum.fecha_nacimiento, nombre: @mascotum.nombre, raza: @mascotum.raza } }
    assert_redirected_to mascotum_url(@mascotum)
  end

  test "should destroy mascotum" do
    assert_difference("Mascotum.count", -1) do
      delete mascotum_url(@mascotum)
    end

    assert_redirected_to mascota_url
  end
end
