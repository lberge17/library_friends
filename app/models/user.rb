class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :libraries
  has_many :users, through: :libraries
  
  has_many :follows
  # Allows association to view list of users who follow a given user i.e. user.followers
  has_many :follower_relationships, foreign_key: :following_id, class_name: 'Follow'
  has_many :followers, through: :follower_relationships, source: :follower
  # Allows association to view list of users who follow a given user i.e. user.followings
  has_many :following_relationships, foreign_key: :follower_id, class_name: 'Follow'
  has_many :followings, through: :follower_relationships, source: :following

  has_many :recommendations
  has_many :recommended_books, through: :recommendations, foreign_key: "book_id", class_name: 'Book'
end
