class Invite < ApplicationRecord
  belongs_to :invite_user, class_name: "User"
  belongs_to :invite_group,  class_name: "Group"
end
