class Veterinario < ApplicationRecord
  has_many :citum, dependent: :destroy


end
