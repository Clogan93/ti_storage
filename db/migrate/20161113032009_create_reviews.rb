class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.text    :comment
      t.string  :written_by
      t.string  :written_via
      t.date    :published_at
      t.integer :rating

      t.references :storage
    end
  end
end
