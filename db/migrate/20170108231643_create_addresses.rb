class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.timestamps
      t.integer :address_id, :contact_id
      t.jsonb :data
    end
  end
end
