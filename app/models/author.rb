class Author < ApplicationRecord
    validates :name, presence: true
    validates :bio, presence: true
    
    has_many :posts
end
