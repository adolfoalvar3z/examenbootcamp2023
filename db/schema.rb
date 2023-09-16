# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_09_10_034747) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "cita", force: :cascade do |t|
    t.date "fecha"
    t.time "hora"
    t.integer "duracion"
    t.bigint "veterinario_id", null: false
    t.bigint "mascota_id", null: false
    t.string "estado", default: "pendiente"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mascota_id"], name: "index_cita_on_mascota_id"
    t.index ["veterinario_id"], name: "index_cita_on_veterinario_id"
  end

  create_table "citas_servicios", force: :cascade do |t|
    t.bigint "servicio_id", null: false
    t.bigint "cita_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cita_id"], name: "index_citas_servicios_on_cita_id"
    t.index ["servicio_id"], name: "index_citas_servicios_on_servicio_id"
  end

  create_table "clientes", force: :cascade do |t|
    t.string "nombre"
    t.string "apellido"
    t.string "direccion"
    t.string "telefono"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mascota", force: :cascade do |t|
    t.string "nombre"
    t.string "especie"
    t.string "raza"
    t.date "fecha_nacimiento"
    t.bigint "cliente_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cliente_id"], name: "index_mascota_on_cliente_id"
  end

  create_table "medical_historials", force: :cascade do |t|
    t.text "hitorial_medico"
    t.text "notas"
    t.bigint "mascota_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mascota_id"], name: "index_medical_historials_on_mascota_id"
  end

  create_table "servicios", force: :cascade do |t|
    t.string "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "nombre"
    t.string "apellido"
    t.string "direccion"
    t.string "telefono"
    t.string "role", default: "user", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "veterinarios", force: :cascade do |t|
    t.string "nombre"
    t.string "apellido"
    t.string "especialidad"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "cita", "mascota", column: "mascota_id"
  add_foreign_key "cita", "veterinarios"
  add_foreign_key "citas_servicios", "cita", column: "cita_id"
  add_foreign_key "citas_servicios", "servicios"
  add_foreign_key "mascota", "clientes"
  add_foreign_key "medical_historials", "mascota", column: "mascota_id"
end
