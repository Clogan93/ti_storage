class CreateSubscriptions < ActiveRecord::Migration[5.0]
  def change
    create_table :subscriptions do |t|
      t.timestamps
      t.string :name, :email
    end
  end
end
