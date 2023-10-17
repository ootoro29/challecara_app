class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.text :body
      t.integer :writer_id
      t.references :host_page, polymorphic: true
      t.timestamps
    end
  end
end
