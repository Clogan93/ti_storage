class CreateCarts < ActiveRecord::Migration[5.0]
  def change
    create_table :carts do |t|
      t.timestamps
      t.integer :site_id, :unit_id, :account_id, :contact_id
      t.jsonb :data
    end
  end
end
