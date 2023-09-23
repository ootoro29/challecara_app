class AddColumnToQPage < ActiveRecord::Migration[7.0]
  def change
    add_column :q_pages, :check, :boolean, null: false, default: false
  end
end
