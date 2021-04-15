class User < ApplicationRecord
    has_one_attached :avatar
    has_secure_password

    has_many :posts
    has_many :authors, through: :posts
    has_many :genres, through: :posts

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :password, length: { in: 6..20 }
    validates :password, presence: true
    validates :email, uniqueness: true
    validates :email, presence: true
    validates :username, uniqueness: true
    validates :username, presence: true
end