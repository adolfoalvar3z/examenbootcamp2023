class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  validates :role, inclusion: { in: %w[normal administrador] }

  enum role: {
    user: 'user',
    vet: 'vet',
    admin: 'admin'
  }, _default: 'user'

  def full_name
    nombre.blank? ? email : "#{nombre} #{apellido}"
  end
  validates :nombre, presence: true
  validates :apellido, presence: true
  validates :role, presence: true
  validates :email, presence: true
end
