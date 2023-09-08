Rails.application.routes.draw do
  resources :cita
  resources :veterinarios
  resources :mascota do
    resources :registro_medicos
  end
  resources :servicios
  resources :clientes


  root "home#index"

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

end
