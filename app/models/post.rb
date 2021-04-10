class Post < ApplicationRecord
    belongs_to :author
    belongs_to :genre
    # belongs_to :user
    
    validates :title, presence: true
    validates :description, presence: true
    validates :content, presence: true
    validates :genre, presence: true
    validates :author_id, presence: true

    # user has many  comments through posts
    # user has many likes through posts
    # user has many ratings through posts
    # author has many followers through and a user follows many authors? 
end
