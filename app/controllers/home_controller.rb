class HomeController < ApplicationController
  def index
    @pagy, @mascotas = pagy(Mascotum.all)
    @veterinarios = Veterinario.all
    @citas = Citum.all
    @citum = Citum.new
  end


end
