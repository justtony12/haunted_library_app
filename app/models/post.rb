class Post < ApplicationRecord
    belongs_to :author
    belongs_to :genre
    
    validates :title, presence: true
    validates :description, presence: true
    validates :content, presence: true
    validates :genre, presence: true
    validates :author_id, presence: true


    # validates :is_title_case

    # before_validation :make_title_case

    # private

    # def is_title_case
    #     if title.split.any?{|w|w[0].upcase != w[0]}
    #         errors.add(:title, "Title must be in title case")
    #     end
    # end

    # def make_title_case
    #     self.title = self.title.titlecase
    # end
end
