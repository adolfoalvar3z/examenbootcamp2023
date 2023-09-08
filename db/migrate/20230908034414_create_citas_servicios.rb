class CreateCitasServicios < ActiveRecord::Migration[7.0]
  def change
    create_table :citas_servicios do |t|
      t.references :servicio, null: false, foreign_key: true
      t.references :cita, null: false, foreign_key: true

      t.timestamps
    end
  end
end
