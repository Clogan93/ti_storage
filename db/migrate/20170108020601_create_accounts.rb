class CreateAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :accounts do |t|
      t.timestamps
      t.string :first_name, :last_name, :email, :phone
      t.integer :account_id, :contact_id
    end

    change_table :reservations do |t|
      t.integer :site_id, :account_id, :version
      t.decimal :price, precision: 7, scale: 2
    end
  end
end
