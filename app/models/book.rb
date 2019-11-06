class Book < ApplicationRecord
    has_many :libraries
    has_many :users, through: :libraries

    has_many :recommendations
    has_many :user_recommends, through: :recommendations, source: :user
end
