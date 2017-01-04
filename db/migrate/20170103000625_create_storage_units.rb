class CreateStorageUnits < ActiveRecord::Migration[5.0]
  def change
    create_table :storage_units do |t|
      t.timestamps
      t.integer :site_id, :unit_id
      t.jsonb :data
    end
  end
end
