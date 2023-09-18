class Invite < ApplicationRecord
  belongs_to :invite_user, class_name: "User"
  validates :invite_user_id, uniqueness: { scope: :invite_group_id, scope: :create_user_id},
                             comparison: { other_than: :create_user_id }
  belongs_to :create_user, class_name: "User"
  belongs_to :invite_group,  class_name: "Group"
end
