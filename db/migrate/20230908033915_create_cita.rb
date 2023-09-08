class CreateCita < ActiveRecord::Migration[7.0]
  def change
    create_table :cita do |t|
      t.date :fecha
      t.time :hora
      t.integer :duracion
      t.references :veterinario, null: false, foreign_key: true
      t.references :mascota, null: false, foreign_key: true
      t.string :estado

      t.timestamps
    end
  end
end
