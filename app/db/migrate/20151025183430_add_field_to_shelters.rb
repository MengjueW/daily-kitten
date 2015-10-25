class AddFieldToShelters < ActiveRecord::Migration
  def change
      add_column :shelters, :name, :string
  end
end
