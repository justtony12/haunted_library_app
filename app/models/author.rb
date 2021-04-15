class Author < ApplicationRecord
    has_one_attached :avatar
    validates :name, presence: true
    validates :bio, presence: true

    belongs_to :user
    has_many :posts
end