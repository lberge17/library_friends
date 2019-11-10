class Book < ApplicationRecord
    has_many :libraries
    has_many :users, through: :libraries

    has_many :recommendations
    has_many :user_recommends, through: :recommendations, source: :user

    def search(attribute, query)
        case attribute
        when "author"
            author_search(query).order("author")
        when "title"
            title_search(query).order("title")
        end
    end

    def author_search(query)
        Book.where("author LIKE ?", "%#{query}%")
    end

    def title_search(query)
        Book.where("title LIKE ?", "%#{query}%")
    end
end
