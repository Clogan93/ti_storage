class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string :title # category
      t.string :slug # area_slug
    end
  end
end
