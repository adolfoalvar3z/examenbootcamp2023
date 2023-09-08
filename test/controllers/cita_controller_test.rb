require "test_helper"

class CitaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @citum = cita(:one)
  end

  test "should get index" do
    get cita_url
    assert_response :success
  end

  test "should get new" do
    get new_citum_url
    assert_response :success
  end

  test "should create citum" do
    assert_difference("Citum.count") do
      post cita_url, params: { citum: { duracion: @citum.duracion, estado: @citum.estado, fecha: @citum.fecha, hora: @citum.hora, mascota_id: @citum.mascota_id, veterinario_id: @citum.veterinario_id } }
    end

    assert_redirected_to citum_url(Citum.last)
  end

  test "should show citum" do
    get citum_url(@citum)
    assert_response :success
  end

  test "should get edit" do
    get edit_citum_url(@citum)
    assert_response :success
  end

  test "should update citum" do
    patch citum_url(@citum), params: { citum: { duracion: @citum.duracion, estado: @citum.estado, fecha: @citum.fecha, hora: @citum.hora, mascota_id: @citum.mascota_id, veterinario_id: @citum.veterinario_id } }
    assert_redirected_to citum_url(@citum)
  end

  test "should destroy citum" do
    assert_difference("Citum.count", -1) do
      delete citum_url(@citum)
    end

    assert_redirected_to cita_url
  end
end
