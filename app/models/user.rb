class User < ApplicationRecord
    has_secure_password

    validates :name, length: { minimum: 2 }
    validates :password, length: { in: 6..20 }
    # validates :email, uniqueness: true
    # validates :username, :uniqueness: true
end
