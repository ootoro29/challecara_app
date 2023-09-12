class AddColumn < ActiveRecord::Migration[7.0]
  def change
    drop_table :administrators
  end
end
