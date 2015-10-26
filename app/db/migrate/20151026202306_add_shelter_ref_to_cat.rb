class AddShelterRefToCat < ActiveRecord::Migration
  def change
    add_reference :cats, :shelter, index: true, foreign_key: true
  end
end
