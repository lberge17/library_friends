class Library < ApplicationRecord
    belongs_to :user
    belongs_to :book

    accepts_nested_attributes_for :book

    def self.popular_books
        # returns 5 most popular books in libraries
        Library.order('COUNT(user_id) DESC').group('book_id').limit(5).map{|library| library.book }
    end
end
