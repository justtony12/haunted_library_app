class Post < ApplicationRecord
    has_one_attached :avatar
    
    belongs_to :author
    belongs_to :genre
    belongs_to :user, :class_name => "User", :foreign_key => 'user_id'
    
    validates :title, presence: true
    validates :description, presence: true
    validates :content, presence: true

    # user has many  comments through posts
    # user has many likes through posts
    # user has many ratings through posts
    # author has many followers through and a user follows many authors? 
end
