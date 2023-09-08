class HomeController < ApplicationController
  def index
    @pagy, @mascotas = pagy(Mascotum.all)
    @veterinarios = Veterinario.all

  end
end
