class CreateQPages < ActiveRecord::Migration[7.0]
  def change
    create_table :q_pages do |t|
      t.string :title
      t.integer :book_id
      t.integer :writer_id

      t.timestamps
    end
  end
end
