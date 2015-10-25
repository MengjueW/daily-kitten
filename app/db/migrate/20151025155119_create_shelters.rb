class CreateShelters < ActiveRecord::Migration
  def change
    create_table :shelters do |t|
      t.string :title
      t.string :url
      t.string :city

      t.timestamps null: false
    end
  end
end
