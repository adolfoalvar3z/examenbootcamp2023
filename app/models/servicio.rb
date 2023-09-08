class Servicio < ApplicationRecord
  has_many :citas_servicios, dependent: :destroy
  validates :nombre, presence: true
end
