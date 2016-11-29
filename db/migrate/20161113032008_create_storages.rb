class CreateStorages < ActiveRecord::Migration[5.0]
  def change
    create_table :storages do |t|
      t.string :category
      t.string :title
      t.string :slug
      t.string :area_slug
      t.string :phone

      t.string :address
      t.string :area
      t.string :zip_code
      t.string :coordinates

      t.text :office_hours
      t.text :access_hours

      t.text :description_1
      t.text :description_2
      t.text :directions
      t.text :features

      t.string :link_to_google
      t.string :link_to_yelp
    end
  end
end
