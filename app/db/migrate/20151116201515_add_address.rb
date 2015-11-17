class AddAddress < ActiveRecord::Migration
  def change
      add_column :shelters, :street_number, :string
      add_column :users, :zipcode, :string
      add_column :users, :state, :string
      add_column :users, :city, :string
      add_column :users, :street_number, :string
      add_column :users, :phone_number, :string
  end
end
