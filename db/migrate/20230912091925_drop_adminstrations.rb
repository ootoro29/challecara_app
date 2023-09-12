class DropAdminstrations < ActiveRecord::Migration[7.0]
  def change
    drop_table :adminstrators
  end
end
