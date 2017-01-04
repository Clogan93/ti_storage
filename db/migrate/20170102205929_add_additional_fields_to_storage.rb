class AddAdditionalFieldsToStorage < ActiveRecord::Migration[5.0]
  def change
    enable_extension 'citext'
    change_table(:storages) do |t|
      t.integer :site_id
      t.jsonb :data
    end
  end
end
