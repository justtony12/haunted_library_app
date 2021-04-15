class Post < ApplicationRecord
    has_one_attached :avatar
    
    belongs_to :author
    belongs_to :genre
    belongs_to :user
    
    validates :title, presence: true
    validates :description, presence: true
    validates :content, presence: true
end