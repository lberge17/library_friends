class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, :omniauth_providers => [:facebook]
  
  validates :name, presence: true
  
  has_many :libraries
  has_many :books, through: :libraries
  
  has_many :follows

  # Allows association to view list of users who follow a given user i.e. user.followers
  has_many :follower_relationships, foreign_key: :following_id, class_name: 'Follow'
  has_many :followers, through: :follower_relationships, source: :follower
  
  # Allows association to view list of users who follow a given user i.e. user.following
  has_many :following_relationships, foreign_key: :follower_id, class_name: 'Follow'
  has_many :following, through: :following_relationships, source: :following

  has_many :recommendations
  has_many :recommended_books, through: :recommendations, source: :book

  # The following two methods are for users signing up with Facebook
  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name
      user.image = auth.info.image
    end
  end

  def self.search(name: nil, email: nil)
    User.where("name LIKE ? AND email LIKE ?", "%#{name}%", "%#{email}%").order("name")
  end

  def alpha_books
    books.order("title")
  end

  def follower_count
    followers.count
  end

  def following_count
    following.count
  end
end
