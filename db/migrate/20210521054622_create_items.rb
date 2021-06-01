class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.string :image_id
      t.integer :genre_id
      t.integer :price
      t.boolean :sale_status

      t.timestamps
    end
  end
end
