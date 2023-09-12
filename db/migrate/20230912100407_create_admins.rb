class CreateAdmins < ActiveRecord::Migration[7.0]
  def change
    create_table :admins do |t|
      t.integer :admin_user_id
      t.integer :admin_group_id

      t.timestamps
    end
  end
end
