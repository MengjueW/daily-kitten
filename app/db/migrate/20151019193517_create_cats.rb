class CreateCats < ActiveRecord::Migration
  def change
    drop_table :cats
    create_table :cats do |t|
      t.string :name
      t.integer :age
      t.string :breed
      t.string :sex
      t.text :description

      t.timestamps null: false
    end
  end
end
