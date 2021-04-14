class Genre < ApplicationRecord
    has_one_attached :avatar
    validates :name, presence: true
    validates :description, presence: true
    belongs_to :user, :class_name => "User", :foreign_key => 'user_id'

    has_many :posts
end
