class Mascotum < ApplicationRecord
  belongs_to :cliente
  has_many :citum
  has_one_attached :foto
  has_many :registro_medicos
  validates :nombre, presence: true, uniqueness: true
end
