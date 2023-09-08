class CreateRegistroMedicos < ActiveRecord::Migration[7.0]
  def change
    create_table :registro_medicos do |t|
      t.text :historial_medico
      t.text :notas
      t.references :mascota, null: false, foreign_key: true

      t.timestamps
    end
  end
end
