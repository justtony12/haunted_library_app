class Author < ApplicationRecord
    validates :name, presence: true
    validates :bio, private: true
end
