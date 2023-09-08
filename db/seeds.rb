require 'faker'

User.create(nombre: "Adolfo", apellido: "Alvarez", email: "adolfo.alvar3z.p@gmail.com", password: "adolfo12", password_confirmation: "adolfo12", role: "admin", direccion: "Calle 1", telefono: "12345678")
User.create(nombre: "Juan", apellido: "Perez", email: "juan@perez.cl", password: "juan12", password_confirmation: "juan12", role: "user", direccion: "Calle 2", telefono: "12345678")
User.create(nombre: "Pedro", apellido: "Perez", email: "pedro@perez.cl", password: "pedro12", password_confirmation: "pedro12", role: "vet", direccion: "Calle 3", telefono: "12345678")

20.times do
Cliente.create(nombre: Faker::Name.name, apellido: Faker::Name.last_name, email: Faker::Internet.email, direccion: Faker::Address.street_address, telefono: Faker::PhoneNumber.cell_phone)
end

20.times do
  Veterinario.create(nombre: Faker::Name.name, apellido: Faker::Name.last_name, especialidad: "general")
end

Servicio.create(nombre: "Consulta general")
Servicio.create(nombre: "Consulta de especialidad")
Servicio.create(nombre: "Vacunación")
Servicio.create(nombre: "Desparasitación")
Servicio.create(nombre: "Castración")
Servicio.create(nombre: "Esterilización")
Servicio.create(nombre: "Cirugía")
Servicio.create(nombre: "Radiografía")
Servicio.create(nombre: "Ecografía")
Servicio.create(nombre: "Análisis de sangre")
Servicio.create(nombre: "Análisis de orina")
Servicio.create(nombre: "Alimentación")
Servicio.create(nombre: "Accesorios")
Servicio.create(nombre: "Peluquería")
Servicio.create(nombre: "Estética")
Servicio.create(nombre: "Adiestramiento")
Servicio.create(nombre: "Paseo")
Servicio.create(nombre: "Hotel")
Servicio.create(nombre: "Refugio")
Servicio.create(nombre: "Adopción")
Servicio.create(nombre: "Educación para propietarios")
Servicio.create(nombre: "Orientación nutricional")
Servicio.create(nombre: "Control de natalidad")
Servicio.create(nombre: "Control de enfermedades")

20.times do
  Mascotum.create(nombre: Faker::Creature::Animal.name, especie: Faker::Creature::Animal.name, raza: Faker::Creature::Animal.name, fecha_nacimiento: Faker::Date.birthday(min_age: 1, max_age: 10), cliente_id: Faker::Number.between(from: 1, to: 10))
end

20.times do
Citum.create(fecha: Faker::Date.between(from: '2021-01-01', to: '2021-12-31'), hora: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now), duracion: Faker::Number.between(from: 1, to: 3), veterinario_id: Faker::Number.between(from: 1, to: 10), mascota_id: Faker::Number.between(from: 1, to: 10), estado: "pendiente")
end

