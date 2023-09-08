json.extract! registro_medico, :id, :historial_medico, :notas, :mascota_id, :created_at, :updated_at
json.url registro_medico_url(registro_medico, format: :json)
