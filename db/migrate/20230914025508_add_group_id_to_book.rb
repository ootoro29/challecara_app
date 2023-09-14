class AddGroupIdToBook < ActiveRecord::Migration[7.0]
  def change
    add_reference :books, :group, null: false, foreign_key: true
  end
end
