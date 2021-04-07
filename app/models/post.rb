class Post < ApplicationRecord
    #belongs_to :author
    validates :title, presence: true
    validates :description, presence: true
    validates :content, presence: true
    validates :genre, presence: true
    validates :author, presence: true
end
