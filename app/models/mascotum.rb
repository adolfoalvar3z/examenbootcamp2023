class Mascotum < ApplicationRecord

  belongs_to :cliente
  has_many :citum
  has_one_attached :foto
  has_many :medical_historials, dependent: :destroy, foreign_key: 'mascota_id'
  validates :nombre, presence: true, uniqueness: true
end
