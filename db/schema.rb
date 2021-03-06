# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_201_016_115_525) do
  create_table 'datapoints', force: :cascade do |t|
    t.integer 'sensor_id', null: false
    t.integer 'value'
    t.time 'sensor_time'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['sensor_id'], name: 'index_datapoints_on_sensor_id'
  end

  create_table 'groups', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'plants', force: :cascade do |t|
    t.string 'name'
    t.integer 'group_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['group_id'], name: 'index_plants_on_group_id'
  end

  create_table 'sensors', force: :cascade do |t|
    t.string 'Sensor_Type'
    t.integer 'plant_id'
    t.integer 'group_id'
    t.integer 'low_threshold'
    t.integer 'high_threshold'
    t.string 'hardware_id'
    t.boolean 'active'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['group_id'], name: 'index_sensors_on_group_id'
    t.index ['plant_id'], name: 'index_sensors_on_plant_id'
  end

  add_foreign_key 'datapoints', 'sensors'
  add_foreign_key 'plants', 'groups'
  add_foreign_key 'sensors', 'groups'
  add_foreign_key 'sensors', 'plants'
end
