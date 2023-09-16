class MedicalHistorial < ApplicationRecord
  belongs_to :mascota, class_name: 'Mascotum'
end
