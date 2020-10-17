class Initialdatabase < ActiveRecord::Migration[6.0]
  def change
    create_table :groups do |t|
      t.string :name
      t.timestamps
    end
    create_table :plants do |t|
      t.string :name
      t.references :group, null: false, foreign_key: true
      t.timestamps
    end
    create_table :sensors do |t|
      t.string :type
      t.references :plant, null: false, foreign_key: true
      t.integer :low_threshold
      t.integer :high_threshold
      t.string :hardware_id
      t.boolean :active
      t.timestamps
    end
    create_table :sensor_values do |t|
      t.references :sensor, null: false, foreign_key: true
      t.integer :value
      t.time :sensor_time
      t.timestamps
    end
  end
end
