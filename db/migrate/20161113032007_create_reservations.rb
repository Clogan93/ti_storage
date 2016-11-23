class CreateReservations < ActiveRecord::Migration[5.0]
  def change
    create_table :reservations do |t|
      t.string :type
      t.string :first_name
      t.string :last_name
      t.date   :move_in_date
      t.string :phone
      t.string :email

      t.string :card_name
      t.string :card_number
      t.date   :card_expiry_date
      t.string :coupon_code

      t.timestamps
    end
  end
end
