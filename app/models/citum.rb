class Citum < ApplicationRecord
  belongs_to :veterinario
  belongs_to :mascota, class_name: 'Mascotum'
  has_many :citas_servicios
  validates :fecha, presence: true
  validates :hora, presence: true
  validates :veterinario_id, presence: true
  validates :mascota_id, presence: true
end
