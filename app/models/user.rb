class User < ApplicationRecord
    has_one_attached :avatar
    has_secure_password

    has_many :posts
    has_many :authors, through: :posts
    has_many :genres, through: :posts

    # validates :first_name, presence: true
    # validates :last_name, presence: true
    validates :password, length: { in: 6..20 }
    validates :password, presence: true
    validates :email, uniqueness: true
    validates :email, presence: true
    validates :username, uniqueness: true
    validates :username, presence: true

    def self.from_omniauth(auth)
        self.find_or_create_by(provider: auth["provider"], uid: auth["uid"]) do |u|
            u.email = auth['info']['email']
            u.password = SecureRandom.hex(20)
            u.username = auth['info']['name'].downcase.gsub(" ", "_")
          end
    end
end