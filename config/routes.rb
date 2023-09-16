Rails.application.routes.draw do
  resources :cita
  resources :veterinarios
  resources :medical_historials
  resources :mascota do
    resources :medical_historials
  end

  resources :servicios
  resources :clientes
  resources :home


  root "home#index"

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

end
