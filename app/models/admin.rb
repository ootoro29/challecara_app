class Admin < ApplicationRecord
    belongs_to :admin_group, class_name: "Group"
    belongs_to :admin_user, class_name: "User"
end
