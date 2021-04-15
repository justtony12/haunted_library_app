class Genre < ApplicationRecord
    has_one_attached :avatar
    validates :name, presence: true
    validates :description, presence: true

    belongs_to :user
    has_many :posts
end