class AddStuffToShelters < ActiveRecord::Migration
  def change
      add_column :shelters, :state, :string
      add_column :shelters, :zipcode, :integer
      add_index :shelters, :state
      add_index :shelters, :zipcode
  end
end
