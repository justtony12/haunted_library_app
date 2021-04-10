class User < ApplicationRecord
    has_secure_password
    has_many :posts, :class_name => "Post", :foreign_key => "user_id"
    has_many :authors, :class_name => "Author", :foreign_key => "user_id"
    has_many :genres, :class_name => "Genre", :foreign_key => "user_id"

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :password, length: { in: 6..20 }
    validates :password, presence: true
    validates :email, uniqueness: true
    validates :email, presence: true
    validates :username, uniqueness: true
    validates :username, presence: true
end
