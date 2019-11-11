class Library < ApplicationRecord
    belongs_to :user
    belongs_to :book

    accepts_nested_attributes_for :book

    scope :popular_books, -> { order('COUNT(user_id) DESC').group('book_id').limit(5).map{|library| library.book } }
end
