class PPage < ApplicationRecord
    belongs_to :writer, class_name: "User"
    belongs_to :book,  class_name: "Book"
    has_many :messages, as: :host_page
end
