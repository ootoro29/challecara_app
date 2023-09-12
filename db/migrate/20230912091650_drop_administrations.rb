class DropAdministrations < ActiveRecord::Migration[7.0]
  def change
    drop_table :administrations
  end
end
