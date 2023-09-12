class Administrator < ApplicationRecord
  belongs_to :admin_user, class_name: "User"
  belongs_to :admin_group, class_name:"Group"
end
