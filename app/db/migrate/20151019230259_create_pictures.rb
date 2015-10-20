class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.text :description
      t.string :image
      t.integer :cat_id

      t.timestamps null: false
    end
  end
end
