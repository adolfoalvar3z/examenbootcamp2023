class CreateMedicalHistorials < ActiveRecord::Migration[7.0]
  def change
    create_table :medical_historials do |t|
      t.text :hitorial_medico
      t.text :notas
      t.references :mascota, null: false, foreign_key: true

      t.timestamps
    end
  end
end
