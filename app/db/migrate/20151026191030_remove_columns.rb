class RemoveColumns < ActiveRecord::Migration
  def change
      remove_column :shelters, :title
      remove_column :shelters, :city
      remove_column :shelters, :url
  end
end
