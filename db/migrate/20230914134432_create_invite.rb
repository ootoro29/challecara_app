class CreateInvite < ActiveRecord::Migration[7.0]
  def change
    create_table :invites do |t|
      t.integer :invite_user_id
      t.integer :invite_group_id

      t.timestamps
    end
  end
end
