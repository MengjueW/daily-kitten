class AddCatIdToComments < ActiveRecord::Migration
  def change
    add_column :comments, :cat_id, :integer
  end
end
