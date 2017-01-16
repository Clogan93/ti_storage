class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.boolean :is_customer
      t.jsonb :data

      t.timestamps
    end
  end
end
