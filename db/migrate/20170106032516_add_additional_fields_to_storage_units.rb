class AddAdditionalFieldsToStorageUnits < ActiveRecord::Migration[5.0]
  def change
    change_table(:storage_units) do |t|
      t.integer :version
      t.decimal :rent_rate, :push_rate, precision: 7, scale: 2
      t.integer :width, :depth, :height
      t.decimal :square_feet, precision: 7, scale: 2
      t.integer :total_units_in_available_status
    end
  end
end
