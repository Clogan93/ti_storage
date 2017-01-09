class CreatePhones < ActiveRecord::Migration[5.0]
  def change
    create_table :phones do |t|
      t.timestamps
      t.integer :phone_id, :contact_id
      t.jsonb :data
    end
  end
end
