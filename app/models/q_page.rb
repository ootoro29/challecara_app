class QPage < ApplicationRecord
    belongs_to :writer, class_name: "User"
    belongs_to :book,  class_name: "Book"
end
