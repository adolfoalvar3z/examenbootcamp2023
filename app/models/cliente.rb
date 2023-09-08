class Cliente < ApplicationRecord
  has_many :mascotum, dependent: :destroy
  validates :nombre, presence: true
  validates :apellido, presence: true
  validates :telefono, presence: true
  validates :email, presence: true
end
