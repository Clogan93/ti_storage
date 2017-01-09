class AddAdditionalFieldsToReservations < ActiveRecord::Migration[5.0]
  def change
    change_table(:reservations) do |t|
      t.integer :quote_id, :rental_id
    end
  end
end
