class RegistroMedico < ApplicationRecord
  belongs_to :mascota, class_name: 'Mascotum', foreign_key: 'mascota_id'
end
