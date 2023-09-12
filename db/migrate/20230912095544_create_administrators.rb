class CreateAdministrators < ActiveRecord::Migration[7.0]
  def change
    create_table :administrators do |t|
      t.references :admin_user, null: false, foreign_key: true
      t.references :admin_group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
