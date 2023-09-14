class Group < ApplicationRecord
    has_and_belongs_to_many :users
    validates :name,  presence: true
    has_many :admins,foreign_key: :admin_group_id
    has_many :admin_users ,through: :admins , source: :admin_user

    has_many :books
end
