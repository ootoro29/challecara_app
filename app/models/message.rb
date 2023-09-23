class Message < ApplicationRecord
    belongs_to :host_page, polymorphic: true
    validates :body,  presence: true
    belongs_to :writer, class_name: "User"
end
