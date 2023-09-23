class Book < ApplicationRecord
    validates :name,  presence: true , length: { minimum: 1 }

    belongs_to :group

    has_many :q_pages,foreign_key: :book_id
    has_many :p_pages,foreign_key: :book_id
end
