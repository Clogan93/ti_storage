class CreatePayments < ActiveRecord::Migration[5.0]
  def change
    create_table :payments do |t|
      t.timestamps
      t.integer :reservation_id, :transaction_id
      t.jsonb :data
    end
  end
end
