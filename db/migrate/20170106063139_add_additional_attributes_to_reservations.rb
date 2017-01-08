class AddAdditionalAttributesToReservations < ActiveRecord::Migration[5.0]
  def change
    change_table(:reservations) do |t|
      t.integer :unit_id
    end
  end
end
