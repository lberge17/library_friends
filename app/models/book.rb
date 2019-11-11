class Book < ApplicationRecord
    has_many :libraries
    has_many :users, through: :libraries

    has_many :recommendations
    has_many :user_recommends, through: :recommendations, source: :user

    def self.search(author: nil, title: nil)
        Book.where("author LIKE ? AND title LIKE ?", "%#{author}%", "%#{title}%").alphabetize
    end

    def self.alphabetize
        self.order("author")
    end
end
